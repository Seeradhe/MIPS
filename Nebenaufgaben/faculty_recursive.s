#
# data
#
.data
str1: .asciiz "Gebe einen Wert ein für welchen die Fakultät berechnet werden soll: "
str2: .asciiz "Das Ergebnis lautet: "
.align 2

.globl main
.text

main:

    # Syntax used for printing str onto console
    la      $a0, str1        
    li      $v0, 4
    syscall 

    # Syntax used for reading a value of console and storing in $t0
    li      $v0, 5           
    syscall
    move    $a0, $v0

    jal fac

    move    $t0, $v0

    # Syntax used for printing str onto console
    la      $a0, str2        
    li      $v0, 4
    syscall 

    # Print the value that was to be calculated the faculty of to the console
    move $a0, $t0
    li $v0, 1
    syscall

  # terminates the program, code 10 is for "exit"
    li $v0, 10
    syscall

fac:
    addi $sp, $sp, -8 # reserviere Speicher
    sw $ra, 0($sp) # rette Inhalt von $ra und $a0
    sw $a0, 4($sp)
    blt $a0, 2, return1 # ist n <= 1?
    addi $a0, $a0, -1 # berechne n–1
    jal fac
    lw $ra, 0($sp) # Inhalt von $ra, $a0 wiederherstellen
    lw $a0, 4($sp)
    addi $sp, $sp, 8
    mul $v0, $a0, $v0 # rechne n*fact(n-1)
    jr $ra

return1: addi $v0, $zero, 1 # gebe 1 zurück
    addi $sp, $sp, 8 # Speicher frei geben
    jr $ra