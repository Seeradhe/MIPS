#
# data
#
.data
result: .word 0
str1: .asciiz "Enter an Int to receive the faculty of: "
str2: .asciiz "The result of the faculty of "
str3: .asciiz " is: "

.align 2

.globl main
.text


main:

    # Syntax used for printing str1 onto console
    la      $a0, str1        # loads the adress of str1 into $a0
    li      $v0, 4           # saves the syscall 4 --> print_string into $v0
    syscall             # calls the code in $v0 --> print_string($a0)

    # Syntax used for reading a value of console and storing in $t0
    li      $v0, 5           
    syscall
    move    $t3, $v0    # exit condition variable

    li $t1, 1           # i variable
    li $t2, 1           # result variable

fact:
    bgt	    $t1, $t3, endoffact	    # if i > exit condition j to label
    
    mult	$t1, $t2			
    mflo	$t2	
    
    addi    $t1, $t1, 1    # Increment i

    j fact

endoffact:
    sw		$t2, result	# Storing the result of the calculation in the memory 


    # Syntax used for printing str1 onto console
    la $a0, str2        # loads the adress of str1 into $a0
    li $v0, 4           # saves the syscall 4 --> print_string into $v0
    syscall             # calls the code in $v0 --> print_string($a0)

    # Print the value that was to be calculated the faculty of to the console
    move $a0, $t3
    li $v0, 1
    syscall

    # Syntax used for printing str2 onto console
    la $a0, str3        
    li $v0, 4           
    syscall             


    # Print the value that was to be calculated the faculty of to the console
    move $a0, $t2
    li $v0, 1
    syscall
    
     # terminates the program, code 10 is for "exit"
    li $v0, 10
    syscall