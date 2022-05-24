
# command + shift + p --> opens top command line

#
# data decleration
#
.data
mystring: .asciiz "Hello MIPS World!"

#
# code
#
.globl main
.text

main: 
    la $a0, mystring    # load adress of mystring into $a0
    li $v0, 4           # load immediate: 
    syscall             # call systemcall: looks in $v0 what to do 
                        # "print string" --> looks in $