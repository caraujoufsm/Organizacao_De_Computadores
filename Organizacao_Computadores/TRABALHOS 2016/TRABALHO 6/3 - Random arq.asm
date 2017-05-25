.data
Vetor: .word 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0 0x0
Tamanho: .word 10
fout: .asciiz "numeros.txt"

.text
.globl main

main:
	la $t0,Vetor		# Carrega o Vetor para $t0
	la $t1,Tamanho		# Recebe o endereço de Tamanho
	lw $t1,0($t1)		# $t1 contem o tamanho do vetor

abre_arq:
	li $v0, 13		# Código para abrir um arquivo
	la $a0, fout		# Nome do arquivo a ser aberto
	li $a1, 1		# Abrir para escrita
	li $a2, 0		# Modo ignorado
	syscall			# Chamada do sistema
	move $s6, $v0		# Salva em $s6 a descrição do arquivo

loop:
	blez $t1,escreve_arq	# Se for igual a 0 vai para fim
	
	li	$v0, 42		# 42 é o código da função para gerar
	li	$a1, 100	# Nosso numero aleatório é um numero entre 0<=num<50
	li	$a0, 0		
	syscall			# Temos o valor aleatório em $a0
	
	move $s1,$a0		# Move o numero para $s1
	sw $s1,0($t0)		# Salva o numero no vetor
	addiu $t0,$t0,4		# Incrementa o vetor
	addiu $t1,$t1,-1	# Decrementa o tamanho inicial
	j loop			# Continua no loop

escreve_arq:
	li $v0, 15		# Código para escrever em um arq
	move $a0, $s6		# Passa como argumento o nome do arquivo
	la $a1, Vetor		# Carrega o Endereço base de Vetor para $a1
	li $a2, 400		# Carrega o tamanho do buffer 
	syscall			# Escreve no arquivo
	
fecha_arq:
	li $v0, 16		# Código para fechar um arq
	move $a0, $s6		# Move o nome do arquivo a ser fechado para o $a0
	syscall			# Fecha o arquivo
			
fim:
	li $v0,10		# Código para encerrar o programa
	syscall			# Chamada do sistema