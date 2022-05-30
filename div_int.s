

.data str1 .asciiz "Enter an int value for x"

.align 2

.globl doStuff
.text

doStuff:
    # Syntax used for printing str1 onto console
    la $a0, str1        # loads the adress of str1 into $a0
    li $v0, 4           # saves the syscall 4 --> print_string into $v0
    syscall             # calls the code in $v0 --> print_string($a0)

    # Syntax used for reading a value of console
    # and storing in $t0
    li $v0, 5
    syscall
    move $t0, $v0


    # Here the program from Task1 will calculate the output and save in $t4
    

    #prints the output to the console
    la $a0, $t4
    li $v0, 1
    syscall