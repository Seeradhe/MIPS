# float f2c (float fahr)
# {
#   return cel = ((5.0/9.0) * (fahr - 32.0));
# }

#
# data
#
.data
const5: .float 5.0
const9: .float 9.0
const32: .float 32.0
minimum: .float -273.15

str1: .asciiz "Enter a float value: "
str2: .asciiz "The result is: "

input: .float 0

#
# code
#

.globl main
.text

main: 

    # print a string to console
    la $a0, str1
    li $v0, 4
    syscall

    # read a float of the console
    li $v0, 6
    syscall
    swc1 $f0, input

    # load input and call function
    lwc1 $f12, input
    jal f2c

    # test if value in $f0 is lower than -273.15 °C, if so set to -273.15
    lwc1 $f1, minimum
    sub.s $f0, $f0, $f1

    bgt $f0, $zero, fine 

    lwc1 $f0, minimum
    j  finish

    fine:
    add.s $f0, $f1, $f0

    finish:

    # print output
    mov.s $f12, $f0
    li $v0, 2
    syscall

    # exit
    li $v0, 10
    syscall

f2c:
        lwc1 $f18, const5
        lwc1 $f20, const9
        div.s $f22, $f18, $f20 
        lwc1 $f24, const32
        sub.s $f0, $f12, $f24
        mul.s $f0, $f22, $f0
        jr $ra