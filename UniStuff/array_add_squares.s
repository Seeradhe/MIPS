#
#   The purpose of this task is to create an assembler Program which does
#   the same as the following C Code Snippet
#

#   
#   In C:
#   int v[20];
#   int i = 0;
#   int sum = 0;
#    for (i=0; i<20; i++)
#   {
#   v[i] = i * i;
#   sum += v[i]
#   }
#   sum = sum / 20;
#

#
#   data
#
.data
str1: .asciiz "Das Ergebnis lautet: "


.align 2

arr: .space 80 # 20 times 4 byte --> 80

.globl main
.text

main:
    li $s0, 0 # var i
    li $s1, 0 # var sum
    li $s2, 20 # end of if 

    
for:
    bge		$s0, $s2, end	# if $s0 >= $s2 goto end
    li      $t5, 4
    mult    $t5, $s0
    mflo    $t3
    mult	$s0, $s0			# $s0 * s01 = Hi and Lo registers
    mflo	$t2					# copy Lo to $t2
    sw      $t2, arr($t3)   # Save the value in the array
    add     $s1, $s1, $t2       # add the just saved value onto the sum
    j for
end:

    li      $t1, 20
    div		$s2, $t1			# $s2 / $t1
    mflo	$t2					# $t2 = floor($s2 / t11) --> Ergebnis
    mfhi	$t3					# $t3 = $s2 mot1$t1  --> Rest

    # Syntax used for printing str1 onto console
    la $a0, str1        # loads the adress of str1 into $a0
    li $v0, 4           # saves the syscall 4 --> print_string into $v0
    syscall             # calls the code in $v0 --> print_string($a0)

    # print the soloution which also has been saved in c to the console
    move $a0, $t2
    li $v0, 1
    syscall

    li $v0, 10
    syscall