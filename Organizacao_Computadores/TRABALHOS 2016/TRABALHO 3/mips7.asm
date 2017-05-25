.text
.globl main

# $s1 <- k
# $s2 <- i
# $s4 <- j
main:

li $v0,4	# Comando para "printar" uma string
la $a0, msgk	# Carrega para o $a0 o conteudo dessa string
syscall		# Faz a chamada do sistema

li $v0,5	# Comando para ler um inteiro
syscall		# Faz a chamada do sistema
move $s1,$v0	# move o inteiro recebido para $s1

beq $s1, 10, Case10	# Se ($t0==10) vai para Case10
beq $s1, 11, Case11	# Se ($t0==11) vai para Case11
beq $s1, 12, Case12	# Se ($t0==12) vai para Case12
j FIM			# Vai para FIM

# Comandos CASE

Case0:
la $s0,VetorA	# Carrega o endereço base de VetorA para $s0
sll $s3,$s2,2 	#$s2<- i*4
add $s3,$s0,$s3 #$s3<- a[i]
add $s3,$0,$s2	# a[i] = 0 + i -> a[i] = i
j FIM		# Vai para FIM

Case1:
la $s0,VetorA	# Carrega o endereço base de VetorA para $s0
sll $s3,$s2,2 	#$s2<- i*4
add $s3,$s0,$s3 #$s3<- a[i]
add $s3,$s2,$s2	# a[i] = i+i -> a[i] = 2*i
j FIM		# Vai para FIM

Case10:
la $s0,VetorA	# Carrega o endereço base de VetorA para $s0
sll $s3,$s2,2 	#$s2<- i*4
add $s3,$s0,$s3 #$s3<- a[i]
sll $s4,$s4,2 	#$s4<-j*4
add $s4,$s0,$s4 # $s4<-a[j]
add $s3,$s2,$s4	# a[i] = i + a[j]
j FIM		# Vai para FIM

Case11:
la $s0,VetorA	# Carrega o endereço base de VetorA para $s0
sll $s3,$s2,2 	#$s2<- i*4
add $s3,$s0,$s3 #$s3<- a[i]
sll $s4,$s4,2 	#$s4<-j*4
add $s4,$s0,$s4 # $s4<-a[j]
sub $s3,$s2,$s4	# a[i] = i - a[j]
j FIM		# Vai para FIM

Case12:
li $v0,4	# Comando para "printar" uma string
la $a0, msgi	# Recebe em $a0 o conteudo da string msgi
syscall		# Faz a chamada do sistema

li $v0,5	# Comando para ler um inteiro
syscall		# Faz a chamada do sistema
move $s2,$v0	# Move o inteiro informado pelo usuario para $s2

beq $s2,0,Case0	# Se ($t0==0) vai para Case0
beq $s2,1,Case1	# Se ($t0==1) vai para Case1

FIM:		# Label Fim
#...

.data
VetorA: .word 1,2,3,4,5,6,7,8,9,10
msgk: .asciiz "Entre com o valor de k :"
msgi: .asciiz "Entre com o valor de i :"