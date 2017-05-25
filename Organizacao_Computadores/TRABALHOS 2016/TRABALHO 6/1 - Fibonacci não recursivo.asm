.data
solicitacao:.asciiz "Informe a posição do número desejado da série: "
msgfim:.asciiz " é o número da posição solicitada."

.text
.globl main
main:

li $v0,4		# Codigo para printar uma string
la $a0,solicitacao	# Recebe a string a ser printada
syscall			# Chamada do Sistema	

li $v0,5		# Codigo para ler um inteiro
syscall			# Chamada do sistema
add $a0,$v0,$zero	# Coloca o inteiro em $a0
	
jal fib			# Pula para a função especificada

add $a0,$v0,$zero	# Recebe o retorno e soma 0 para passar como argumento para imprimir
li $v0,1		# Codigo para printar um inteiro
syscall			# Chamada do sistema

li $v0,4		# Codigo para printar uma string
la $a0,msgfim		# Recebe a string a ser printada
syscall			# Chamada do Sistema	

li $v0,10		# Codigo para encerrar um programa
syscall			# Chamada do sistema

fib:    
addi $t0,$zero,1	# Coloca 1 em $t0 para fazer a comparacao seguinte

beqz $a0,return0	# Se o argumento e igual a 0 retorna 0
beq $a0,$t0,return1	# Se o argumento e igual a 1 retorna 1

add $t1,$zero,$zero	# Inicializa com 0 o $t1
add $t2,$zero,$zero	# Inicializa com 0 o $t2
addi $t3,$zero,1	# Inicializa com 1 o $t3
addi $t4,$zero,1	# Inicializa com 1 o $t4

loop:
bge $t4,$a0,fimloop	# Se $t4 e maior ou igual a $a0 vai para o fimloop
add $t1,$t2,$t3		#$t1<-$t2+$t3
add $t2,$zero,$t3	#$t2<-$t3
add $t3,$zero,$t1	#$t3<-$t1
addi $t4,$t4,1		# Incrementa $t4
j loop			# Vai para loop

fimloop:		
add $v0,$zero,$t1	# Coloca $t1 como argumento de saida
jr $ra			# Retorna a função chamadora

return0:
add $v0,$zero,$zero	# Coloca 0 como argumento de saida
jr $ra			# Retorna a função chamadora

return1:
addi $v0,$zero,1	# Coloca 1 como argumento de saida
jr $ra			# Retorna a função chamadora
