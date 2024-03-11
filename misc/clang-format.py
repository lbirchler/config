# https://github.com/llvm-mirror/clang/blob/master/tools/clang-format/clang-format.py
#
# Minimal clang-format vim-integration
#
# - Add to .vimrc to enable for NORMAL and VISUAL mode:
#   map <C-I> :py3f <path-to-this-file>/clang-format.py<cr>
#
# - The `--style` option will be set to `~/.clang-format` if it exists
import difflib
import json
import os.path
import platform
import subprocess
import sys
from pathlib import Path

import vim

# set g:clang_format_path to the path to clang-format if it is not on the path
# Change this to the full path if clang-format is not on the path.
binary = 'clang-format'
if vim.eval('exists("g:clang_format_path")') == '1':
  binary = vim.eval('g:clang_format_path')

# Change this to format according to other formatting styles. See the output of
# 'clang-format --help' for a list of supported styles. The default looks for
# a '.clang-format' or '_clang-format' file to indicate the style that should be
# used.
style = None
fallback_style = None

# set style to ~/.clang-format if it exists
p = Path('~/.clang-format').expanduser()
if p.exists():
  style = f'file:{p}'

if vim.eval('exists("g:clang_format_fallback_style")') == '1':
  fallback_style = vim.eval('g:clang_format_fallback_style')


def get_buffer(encoding):
  if platform.python_version_tuple()[0] == '3':
    return vim.current.buffer
  return [line.decode(encoding) for line in vim.current.buffer]


def main():
  # Get the current text.
  encoding = vim.eval('&encoding')
  buf = get_buffer(encoding)
  # Join the buffer into a single string with a terminating newline
  text = ('\n'.join(buf) + '\n').encode(encoding)

  # Determine range to format.
  if vim.eval('exists("l:lines")') == '1':
    lines = ['-lines', vim.eval('l:lines')]
  elif vim.eval('exists("l:formatdiff")') == '1' and os.path.exists(
      vim.current.buffer.name
  ):
    with open(vim.current.buffer.name) as f:
      ondisk = f.read().splitlines()
    sequence = difflib.SequenceMatcher(None, ondisk, vim.current.buffer)
    lines = []
    for op in reversed(sequence.get_opcodes()):
      if op[0] not in ['equal', 'delete']:
        lines += ['-lines', '%s:%s' % (op[3] + 1, op[4])]
    if lines == []:
      return
  else:
    lines = [
        '-lines',
        '%s:%s' % (vim.current.range.start + 1, vim.current.range.end + 1),
    ]

  # Convert cursor (line, col) to bytes.
  # Don't use line2byte: https://github.com/vim/vim/issues/5930
  _, cursor_line, cursor_col, _ = vim.eval('getpos(".")')  # 1-based
  cursor_byte = 0
  for line in text.split(b'\n')[: int(cursor_line) - 1]:
    cursor_byte += len(line) + 1
  cursor_byte += int(cursor_col) - 1
  if cursor_byte < 0:
    print("Couldn't determine cursor position. Is your file empty?")
    return

  # Avoid flashing an ugly, ugly cmd prompt on Windows when invoking clang-format.
  startupinfo = None
  if sys.platform.startswith('win32'):
    startupinfo = subprocess.STARTUPINFO()
    startupinfo.dwFlags |= subprocess.STARTF_USESHOWWINDOW
    startupinfo.wShowWindow = subprocess.SW_HIDE

  # Call formatter.
  command = [binary, '-cursor', str(cursor_byte)]
  if lines != ['-lines', 'all']:
    command += lines
  if style:
    command.extend(['-style', style])
  if fallback_style:
    command.extend(['-fallback-style', fallback_style])
  if vim.current.buffer.name:
    command.extend(['-assume-filename', vim.current.buffer.name])
  p = subprocess.Popen(
      command,
      stdout=subprocess.PIPE,
      stderr=subprocess.PIPE,
      stdin=subprocess.PIPE,
      startupinfo=startupinfo,
  )
  stdout, stderr = p.communicate(input=text)

  # If successful, replace buffer contents.
  if stderr:
    print(stderr)

  if not stdout:
    print(
        'No output from clang-format (crashed?).\n'
        'Please report to bugs.llvm.org.'
    )
  else:
    header, content = stdout.split(b'\n', 1)
    header = json.loads(header.decode('utf-8'))
    # Strip off the trailing newline (added above).
    # This maintains trailing empty lines present in the buffer if
    # the -lines specification requests them to remain unchanged.
    lines = content.decode(encoding).split('\n')[:-1]
    sequence = difflib.SequenceMatcher(None, buf, lines)
    for op in reversed(sequence.get_opcodes()):
      if op[0] != 'equal':
        vim.current.buffer[op[1]: op[2]] = lines[op[3]: op[4]]
    if header.get('IncompleteFormat'):
      print('clang-format: incomplete (syntax errors)')
    # Convert cursor bytes to (line, col)
    # Don't use goto: https://github.com/vim/vim/issues/5930
    cursor_byte = int(header['Cursor'])
    prefix = content[0:cursor_byte]
    cursor_line = 1 + prefix.count(b'\n')
    cursor_column = 1 + len(prefix.rsplit(b'\n', 1)[-1])
    vim.command('call cursor(%d, %d)' % (cursor_line, cursor_column))


main()
