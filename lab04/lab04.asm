# Calculate the product of data elements of a list
# for MYΥ-402 - Computer Architecture
# Department of Computer Engineering, University of Ioannina
# Aris Efthymiou

        .globl main # declare the label main as global. 
        
        .text 
mult:
        # ---------------------------------------------------------------------
	
	add $t1,$t1,$s1
	addiu $t0,$t0,1
	bne $t0 ,$a1, mult
        add $s0,$t1,$zero
        li $t1,0
        li $t0,0
        # ---------------------------------------------------------------------
       
        jr    $ra # return


listProd:
        # ---------------------------------------------------------------------
    	add $t2,$zero,$ra
      	lw   $t3,0($a0)								
      	lw   $t4,4($a0)  					
      	lw   $t4,0($t4)
      	add  $s1,$zero,$t3
      	add  $a1,$zero,$t4
      	jal mult  
      	lw   $t5,8($a0)
      	add  $s1,$zero,$s0
      	add  $a1,$zero,$t5
      	jal mult  
      	lw   $t6,12($a0)
      	lw   $t6,0($t6)
      	add  $s1,$zero,$s0
      	add  $a1,$zero,$t6
      	jal mult
     #   addi $sp,$sp,-20
     #  sw   $t3,0($sp)
     #  sw   $t4,4($sp)
     #  sw   $t5,8($sp)
     #  sw   $t6,12($sp)
     #  sw   $t7,16($sp)
     #  lw   $a0,4($a0)
     #  sw   $a0,4($sp)
       
        
       
       
        # ---------------------------------------------------------------------
        jr    $t2

	
        ########################################################################
        #  Write your code above. Leave main as is.
        ########################################################################
main:
        # These are for providing input and testing, don't change this in your
        #  final submission
        # ----- Try it with the full list
        
        la    $a0, n1_d
        
        jal   listProd
        addu  $s0, $v0, $zero   # Move the result to s0 for tester to check
       
        # ----- Try it with a null pointer
        #addu  $a0, $zero, $zero
        #jal   listProd
        #addu  $s1, $v0, $zero   # Move the result to s1 for tester to check
        # ----- Try it with 1 item list
       # la    $a0, n5_d
       # jal   listProd
       # addu  $s2, $v0, $zero   # Move the result to s2 for tester to check
        # ----- Try mult by 0
        #la    $a0, na_d
       # jal   listProd
        #addu  $s3, $v0, $zero   # Move the result to s3 for tester to check
	
        addiu      $v0, $zero, 10    # system service 10 is exit
        syscall                      # we are outta here.

        ###############################################################################
        # Data input.  Don't modify.
        ###############################################################################
       .data
# 1st item - head of the list!
n1_d: .word 1
n1_n: .word n2_d  # point to (beginning of) n2

# 3rd item
n3_d: .word 3
n3_n: .word n4_d

# 2nd item
n2_d: .word 2
n2_n: .word n3_d

# 5th item
n5_d: .word 5
n5_n: .word 0 # This is the last iterm in the list

# 4th item
n4_d: .word 4
n4_n: .word n5_d

# Alternative head of list. Value 0 to test mult by 0
na_d: .word 0
na_n: .word n2_d  # point to (beginning of) n2
