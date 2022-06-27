
#
#   data
#
.data
c:  .word 0     # "füllt Speicher mit den Vorzeichenbehafteten 32 Bit Wort" --> Variable c in Mem mit Wert 0
str1: .asciiz "Enter A value: "
str2: .asciiz "Enter B value: "
str3: .asciiz "2 * A + 3 * B equals: "


.align 2

#
#   code
#
.globl addInts
.text

addInts:
    # Syntax used for printing str1 onto console
    la $a0, str1        # loads the adress of str1 into $a0
    li $v0, 4           # saves the syscall 4 --> print_string into $v0
    syscall             # calls the code in $v0 --> print_string($a0)

    # Syntax used for reading a value of console and storing in $t0
    li $v0, 5           # loads code 5 into $v0 --> read_int
    syscall
    move $t0, $v0       # moves the read int into a temporary register

    # Syntax to write content of str2 to console
    la $a0, str2
    li $v0, 4
    syscall

    # Syntax of reading a value of console
    # store value in $t1
    li $v0, 5
    syscall
    move $t1, $v0

    # Multiply A by 2 --> add A and A and store in tmp2
    add $t0, $t0, $t0
    # Multiply B by 3
    add $t2, $t1, $t1
    add $t2, $t1, $t2

    # Add A and B
    add $t4, $t2, $t0

    # print solution text
    la $a0, str3
    li $v0, 4
    syscall

    # moves the value from $t4 (soloution) to the variable c
    # only with store word from left to right
    sw $t4, c

    # print the soloution which also has been saved in c to the console
    move $a0, $t4
    li $v0, 1
    syscall
    
    # terminates the program, code 10 is for "exit"
    li $v0, 10
    syscall