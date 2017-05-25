.text
.globl main

# $s3 <- i
# $s4 <- x
# $s5 <- y
main:
la $s1,VetorA	# Carrega o Endereço base de VetorA

sll $s2,$s3,2 	# $s2 <- i*4
add $s2,$s1,$s2 # Endereço base de a[i]
lw $t0,0($s2)	# Carrega o conteudo de a[i] para $t0
beq $t0,$s4,IF	# Se a[i] == x vai para IF
add $s5,$s2,$0	# y = a[i] + 0 -> y = a[i]
j FIM		# Vai para FIM

IF:
add $s5,$0,$s4 	# y = x

FIM:
#...
.data
VetorA: .word 1,2,3,4,5,6,7,8,9,10
