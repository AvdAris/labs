# 
#   in MIPS assembly using MARS
# for MYΥ-402 - Computer Architecture
# Department of Computer Engineering, University of Ioannina
# Aris Efthymiou

        .globl main # declare the label main as global. 
        
        .text 
     
main:
        ########################################################################
        #  Write your code here
        # 
        ########################################################################

        addiu      $v0, $zero, 10    # system service 10 is exit
        syscall                      # we are outta here.

        ###############################################################################
        # Data input.
        ###############################################################################
       .data
# These are for the "dog" nonogram
cols:    .word 25 # Number of columns in the nonogram. Max is 32, min is 1
rows:    .word 30 # Number of rows in the nonogram. Max is 32, min is 1
picture: .word 0x000007c, 0x00000fe, 0x00000fe, 0x000005e, 0x00000fe, 0x000007e, 0x000003c,
               0x0000018, 0x0001ffc, 0x0003ffe, 0x000303f, 0x000143f, 0x0001c3f, 0x000083f,
               0x000083f, 0x008083f, 0x00f081f, 0x00d9c1f, 0x00f943f, 0x18f007e, 0x11e00fc,
               0x13f01ec, 0x1ff81ff, 0x0ff81ff, 0x0fcc003, 0x070000d, 0x060000c, 0x060000c,
               0x060000c, 0x030001c 

# You can relly on these all being 0s!
r_clues: .word 0 : 512 # alocate space for 512 words
c_clues: .word 0 : 512 # alocate space for 512 words 
# Where does 512 come from: 
#  The maximum puzle dimension is 32, so in the worst case there can be 16 *single* boxes
#   filled in, i.e. the row/column hint would be: 1, 1, ... ,1   16 times
#  That is the max number of hint numbers possible.
#  Each number is a word (32b - 4 bytes), therefore for each row/column we need to have
#  space for 16 words (= 64 bytes).
#  Multiply this by the max number of rows/columns (32) : 16 words * 32 = 512 words (2Ki bytes) 
