set disassembly-flavor intel
set history save on
set follow-fork-mode child
set $base = 0x555555554000 
#set disable-randomization on

# pwndbg
source /home/user/tools/pwndbg/gdbinit.py
set context-code-lines 15
set show-compact-regs on

# gef
#source /home/user/tools/gef/gef.py
