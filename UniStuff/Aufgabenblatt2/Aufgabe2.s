#
#   data
#
.data


.align 2

.globl main
.text

main: 

    addi $t1, $zero, 1   # set i to 1
    add $t2, $zero, $a0(0)     # load the first value of the array into a temp variable
    addi $t3, $zero, 4  # four bytes in an integer

for:
    bgt $t1, $a1, end      # exit condition

    mult	$t1, $t3			# $t1 * $31 
    mflo	$t4					# calc the offset for the array
    

    bgt $t2, $a0($t4), no       # if the current value is bigger dont replace the value

    add $t2, $zero, $a0($t4)

no: #   the value is not bigger

    addi $t1, $t1, 1    # i++

    j for   # repeat the loop
end:

# return $t2 whatever the logic for that would be