# Calculate sums of positive odd and negative even values in an array
#   in MIPS assembly using MARS
# for MYΥ-402 - Computer Architecture
# Department of Computer Engineering, University of Ioannina
# Aris Efthymiou
#aristodimos avdeliodis 2202
        .globl main # declare the label main as global. 
        
        .text 
     
main:
        la         $a0, length       # get address of length to $a0
        lw         $a0, 0($a0)       # get the length in to $a0

        la         $a1, input        # get address of array to $a1

        addiu      $s0, $zero, 0     # sum of positive odd values starts as 0
        addiu      $s1, $zero, 0     # sum of negative even values starts as 0

        ########################################################################
        #  Write your code here
        #  values of $s0, $s1 and check if they are correct
        ###  xwris to loop douleuei swsta,allazwntas thn 29 se lw $t6,0($t5) gia to prwto ,lw $t6,4($t5) gia to deutero klp
        li 	  $v1,0
        li	  $t1,1
loop:   
	sll 	  $t5,$v1,2
	add	  $t5,$a1,$t5
	lw 	  $t6,0($t5)
	addiu  	  $v1,$v1,1
	
	
       slt	  $t0,$zero,$a0
       beq	  $t0,$zero,negative
       beq	  $t0,$t1,positive
	
        
        ########################################################################
negative:
	 andi	  $t2,$t6,0x01
         beq	  $t2,$zero,iseven
         
positive:
 	andi	  $t2,$t6,0x01
        beq	  $t2,$t1,isodd
iseven:
	addu	  $s1,$s1,$t6
        j	  pos
isodd:
       addu	  $s0,$s0,$t6  	
        j	  pos
pos:   
       	bne	  $v1,$a0,loop
        ########################################################################
        
exit: 
        addiu      $v0, $zero, 10    # system service 10 is exit
        syscall                      # we are outta here.
        
        ###############################################################################
        # Data input.
        ###############################################################################
        .data
length: .word 5 # Number of values in the input array
input:  .word 3, -2, 0, 4, -1
