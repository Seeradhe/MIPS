#
#   data
#
.data
str1: .asciiz "Erster Mittelwert > 5 ist "
str2: .asciiz " an Position "
str3: .asciiz "\n"
.align 2

arr: .word 5, 2, 1, 1, 2, 2, 4, 3, 9, 1 # 10 long int array with each having 4 bytes


.globl main
.text

#
#   int tmp = 0;
#   int i = 0;
#   while((tmp <= 5) && (i < 9))
#   {
#       tmp = (a[i] + a[i+1]) / 2;
#       i++;
#   }
#   printf("Erster Mittelwert > 5 ist %d an Position %d\n", tmp, i);
#


main:

# The while loops exits whenever tmp is bigger than 5 or i is bigger than 9
# in the while loop i is incremented and tmp gets a more complex value

move $t1, $zero # tmp is stored in $t1
move $t2, $zero # i is stored in $t2


    li $t3, 5   # both values only need to be asigned once 
    li $t4, 8   # so there is less calls

while:
    bgt		$t1, $t3, end	# if tmp is bigger than 5 exit the loop
    bgt     $t2, $t4, end   # if i is bigger than 8 exit the loop

    li      $s3, 4          # every int has 4 bytes

    addi    $t5, $t2, 1         # offset for the array
    mult	$s3, $t5			# $s3 * $51 = Hi and Lo registers
    mflo	$t5					# copy 5o to $t2
    
    add     $s4, $t2, $zero     # offset for the array
    mult	$s4, $s3			# $s4 * s31 = Hi and Lo registers
    mflo	$s4					# copy Lo to $t2
    

    lw      $s0, arr($s2)       # get data from array, store in the registers
    lw      $s1, arr($s4)
    add     $t1, $s0, $s1       # adds the data and saves it in tmp

    addi    $t6, $zero, 2       # loads 2 into $t6 which tmp will be divided with
    
    div		$t1, $t6			# tmp / 2
    mflo	$t1					# move the value to temp

     move $a0, $t1       # prints the current tmp value to the console
    li $v0, 1
    syscall

    la $a0, str3        # loads the adress of str1 into $a0
    li $v0, 4           # saves the syscall 4 --> print_string into $v0
    syscall             # calls the code in $v0 --> print_string($a0)



    mfhi	$t7					# move the value to $t7, irrelevant because nothing is done with it
    

    addi    $t2, $t2, 1     # i++

    j       while       # repeats the cycle 
end:


    la $a0, str1        # loads the adress of str1 into $a0
    li $v0, 4           # saves the syscall 4 --> print_string into $v0
    syscall             # calls the code in $v0 --> print_string($a0)

    move $a0, $t1       # prints tmp to the console
    li $v0, 1
    syscall

    la $a0, str2        # loads the adress of str1 into $a0
    li $v0, 4           # saves the syscall 4 --> print_string into $v0
    syscall             # calls the code in $v0 --> print_string($a0)

    move $a0, $t2       # prints i to the console
    li $v0, 1
    syscall

