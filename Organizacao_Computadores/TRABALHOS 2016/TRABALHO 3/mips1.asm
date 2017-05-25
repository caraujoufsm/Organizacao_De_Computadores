.text
.globl main

main:

li $t1,10	# i = 10
li $t2,0	# j = 0

L1: # Label L1
sub $t1,$t1,1	# i = i - 1
add $t2,$t2,1	# j = j + 1
beq $zero,$t1,L1 # if(i==0), vai para o procedimento L1
END: # Label END
	#...
.data
