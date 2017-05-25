.text
.globl main

#$s3<-i
#$s4<-j
#$s5<-x
#$s6<-k

main:
la $s1,VetorA	# Carrega o Endereço base de VetorA

While:
bge $s3,$s4,FIM	# Se i>=j vai para FIM
sll $t1,$s3,2	# $t1<-i*4
sll $t2,$s4,2	# $t2<-j*4
add $t3,$s1,$t1	# $t3 <- Endereço base de a[i]
add $t4,$s1,$t2	# $t4 <- Endereço base de a[j]
lw $t6,0($t4)	# Carrega o conteudo de a[j] para $t6
add $t6,$t6,$s5	# $t6 <- a[j]+x
sw $t6,0($t3)	# Salva em a[i] o conteudo de $t6<-a[j]+x
add $s3,$s3,$s6	# i = i+k
j While		# Jump para While
FIM:
#...

.data
VetorA: .word 0,1,2,3,4,5,6,7,8,9
