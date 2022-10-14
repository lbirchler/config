from IPython.terminal.prompts import Prompts, Token
 
class Prompt(Prompts):
    def in_prompt_tokens(self, cli=None):
        return [(Token.Prompt, '>>> '), ]
    def continuation_prompt_tokens(self, cli=None, width=None):
        return [(Token.Prompt, '    '), ]
    def out_prompt_tokens(self, cli=None):
        return [(Token.Prompt, ''), ]

#c.TerminalInteractiveShell.highlighting_style = 'default' 
c.TerminalInteractiveShell.prompts_class = Prompt
c.TerminalInteractiveShell.confirm_exit = False
c.TerminalIPythonApp.display_banner = False
c.TerminalInteractiveShell.editing_mode = 'vi'
c.InteractiveShellApp.extensions = [
    'autoreload',
]
c.InteractiveShellApp.exec_lines = [
    '%autoreload 2'
]

