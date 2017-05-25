.text
.globl main

#$s4 <- i
#$s5 <- j
main:
la $s1,VetorA	# Carrega o Endereço base de VetorA
la $s2,VetorB	# Carrega o Endereço base de VetorB
la $s3,VetorC	# Carrega o Endereço base de VetorC

sll $t1,$s4,2	# $t1 <- i*4
sll $t2,$s5,2	# $t2 <- j*4
add $t3,$s1,$t1	# $t3 <- Endereço base de a[i]
add $t4,$s2,$t1	# $t4 <- Endereço base de b[i]
lw $t6,0($t3)	# Carrega para $t6 o conteudo de $t3
lw $t7,0($t4)	# Carrega para $t7 o conteudo de $t4
beq $t3,$t4,FIM	# Se a[i]==b[i] vai para FIM
add $t5,$s3,$t2	# $t5 <- Endereço base de c[j]
lw $t6,0($t3)	# Carrega para $t6 o conteudo de $t3
lw $t7,0($t5)	# Carrega para $t7 o conteudo de $t5
beq $t6,$t7,IF	# Se a[i]==c[j] vai para IF
j FIM

IF:
lw $t3,0($t3)	# Carrega o conteudo de $t3 para $t3
lw $t5,0($t5)	# Carrega o conteudo de $t5 para $t5
add $t0,$t3,$t5	# $t0 <- a[i]+c[j]
sw $t0,($t4)	# Salva em b[i] o conteudo de $t0 <- a[i]+c[j]
FIM:
#...

.data
VetorA: .word	1,2,3,4,5,6,7,8,9,10
VetorB: .word	10,9,8,7,6,5,4,3,2,1
VetorC: .word	1,2,3,4,5,6,7,8,9,10
