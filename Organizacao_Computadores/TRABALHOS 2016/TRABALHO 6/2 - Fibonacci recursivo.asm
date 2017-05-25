.data
solicitacao:.asciiz "Informe a posi��o do n�mero desejado da s�rie: "
msgfim:.asciiz " � o n�mero da posi��o solicitada."

.text
.globl main
main:

li $v0,4		# C�digo para printar uma string
la $a0,solicitacao	# Recebe a string a ser printada
syscall 		# Chamada do sistema
		
li $v0,5		# C�digo para receber um inteiro
syscall 		# Chamada do sistema
add $a0,$v0,$zero 	# Passa o n�mero como argumento

jal fib 		# Vai para a fun��o fib

add $a0,$v0,$zero	# Passa o retorno como argumento para ser impresso
li $v0,1		# C�digo para printar um inteiro
syscall			# Chamada do sistema

li $v0,4		# Codigo para printar uma string
la $a0,msgfim		# Recebe a string a ser printada
syscall			# Chamada do Sistema	

li $v0,10		# C�digo para encerrar um programa
syscall			# Chamada do sistema

fib:
addi $sp,$sp,-12 	# Abre espa�o na pilha
sw $ra,0($sp)		# Salva o retorno
sw $s0,4($sp)		# Salva o $s0
sw $s1,8($sp)		# Salva o $s1

add $s0,$a0,$zero	# Coloca o valor de argumento em $s0

addi $t1,$zero,1	# Coloca em $t1 o valor 1
beq $s0,$zero,return0	# Se $s0 == 0 retorna 0
beq $s0,$t1,return1	# Se $s0 == 1 retorna 1

addi $a0,$s0,-1		# Decrementa a posi��o informada

jal fib			# Pula para a fun��o

add $s1,$zero,$v0     	# $s1<-$v0
addi $a0,$s0,-2		# $a0 <- $s0 - 2
jal fib               	# Pula para a fun��o
add $v0,$v0,$s1       	#$v0<-$v0+$s1

fim:
lw $ra,0($sp)       	# Recupera os valores da pilha
lw $s0,4($sp)		# Recupera os valores da pilha
lw $s1,8($sp)		# Recupera os valores da pilha
addi $sp,$sp,12       	# "Devolve a mem�ria solicitada"
jr $ra			# Volta a fun��o chamadora

return1:		
li $v0,1		# Carrega 1 em $v0
j fim			# Vai para a fun��o fim

return0 :     
li $v0,0		# Carrega 0 em $v0
j fim			# Vai para a fun��o fim
