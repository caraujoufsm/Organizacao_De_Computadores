.text
.globl main

# i = $s3
# x = $s4
# y = $s5

main:
la $s1,VetorA	# Carrega o Endereço base de VetorA

sll $s6,$s3,2	# $s6 <- i*4
add $s6,$s1,$s6	# Endereço base de a[i]
add $s7,$s3,4	# $s7 <- i*4 + 4
add $s7,$s1,$s7	# Endereço base de a[i+1]
lw $t0,0($s1)	# Carrega o conteudo de a[i] para $t0
lw $t1,0($s7)	# Carrega o conteudo de a[i+1] para $t1
beq $t0,$t1,L1	# Desvia para L1 se a[i] == a[i+1]
sw $s4,($s6)	# a[i] <- x
j FIM		# Encerra o programa

L1:	# Label L1
sw $s5,($s6)	# a[i] <- y
FIM:	# Label Fim
#...

.data
VetorA: .word 1,2,3,4,5,6,7,8,9,10
