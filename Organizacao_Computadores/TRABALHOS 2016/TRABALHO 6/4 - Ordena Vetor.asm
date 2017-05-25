.data
vetor: .word 10, 9, 18, 7, 15, 5, 22, 26, 2, 1

.text
.globl main

main:
	la $a0, vetor	# Endereço do vetor a ser ordenado
	li $a1, 10	# Elementos contidos no vetor
	
	jal ordena
	
	li $s0, 10	# Número de elementos a ser apresentado
	blez $a1, FIM	# Se for menor ou igual a zero pula para fim
	
	la $s1, vetor	# Endereço do número inteiro

LOOP:
	beq $s0, $0, FIM # Sai quando termina os elementos
	lw $a0, 0($s1)	 # Carrega em $a0 o elemento a ser apresentado
	li $v0, 1	# Imprime inteiro
	syscall		# Chamada do sistema
	
	add $a0, $0, ' ' # $a0 tem um espaço
	li $v0, 11	# Imprime caracter
	syscall		# Chamada do sistema
	
	sub $s0, $s0, 1	# Decrementa $s0
	add $s1, $s1, 4	# Passa ao proximo elemento do vetor
	j LOOP		# Continua o Loop

FIM:
	li $v0, 10	# Serviço que termina um programa
	syscall		# Chamada do sistema

ordena:
	sub $sp, $sp, 20	# Ajusta a pilha para guardar os itens
	sw $ra, 8($sp)		# Guarda o $ra
	sw $a0, 4($sp)		# Guarda o $a0 
	sw $a1, 0($sp)		# Guarda o $a1
	
	li $t0, 0		# Carrega 0 em $t0
	subi $t1, $a1, 1	# Reduz o o $a1 e salva em $t1 para verificar fim do programa quando for igual a 0

  LOOP1:
  	bge $t0, $t1, FIM1	# Se o "tamanho" atual do vetor for maior ou igual a 0 vai para FIM1
  	add $t2, $t0, 1		# incrementa $t0 em 1 e salva em $t2
  LOOP2:
  	bge $t2, $a1, FIM2	# Se o "tamanho" do vetor for maior ou igual a 0 vai para FIM2 
  	add $t3, $t0, $t0	# $t3 <- 2*i
  	add $t3, $t3, $t3	# $t3 <- 4*i
  	add $t3, $t3, $a0	# $t3 <- endereço base vetor[i]
  	lw $t5, 0($t3)		# $t5 <- vetor[i]
  	
  	add $t4, $t2, $t2	# $t4 <- 2*j
  	add $t4, $t4, $t4	# $t4 <- 4*j
  	add $t4, $t4, $a0	# $t4 <- endereço base de vetor[j]
  	lw $t6, 0($t4)		# $t6 <- vetor[j]
  	
  	ble $t5, $t6, FIM3	# Se vetor[i]<=vetor[j] vai para FIM3
  	
  	  sw $a0, 12($sp)	# guarda $a0
  	  sw $a1 16($sp)	# guarda $a1
  	  move $a0, $t5		# $a0<-vetor[i]
  	  move $a1, $t6		# $a1<-vetor[j]
  	  jal troca		# Chama o procedimento troca
  	  sw $a0, 0($t3)	# vetor[j] <- vetor[i], valor antigo
  	  sw $a1, 0($t4)	# vetor[i] <- vetor[j], valor antigo
  	  lw $a0, 12($sp)	# Restaura antigo $a0
  	  lw $a1, 16($sp)	# Restaura antigo $a1
 
   FIM3:
   	add $t2, $t2, 1		# j = j + 1
   	j LOOP2			# Continua LOOP2
   FIM2:
   	add $t0, $t0, 1		# i = i + 1
   	j LOOP1			# Continua LOOP1
   FIM1:
   lw $a0, 4($sp)		# Restaura antigo $a0
   lw $ra, 8($sp)		# Restaura $ra
   add $sp, $sp, 20		# Restaura a pilha e remove os elemtnos
   jr $ra			# Retorna para o procedimento chamador
   
   troca:			# Procedimento que troca os valores dos elementos
   	move $t7, $a0
   	move $a0, $a1
   	move $a1, $t7
   	jr $ra  
