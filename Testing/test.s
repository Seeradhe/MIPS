# Exercise 2-18

    #clear $t0 --> $t= 0
    sub $t0, $t0, $t0
    # Subtracts $t0 from $t0 and stores the value --> 0 in $t0
    # effectivly clearing the register - also it only
    # uses one instruction

    #clear beq $t3, small, Label --> if ($t3 == small) go to label
    li $at, small       # li as pseudo instruction
    slt $t3, $at, finish
    slt $at, $t3, finish
    
    j label
    finish:

    # li $t2, big --> $t2 = big
    

