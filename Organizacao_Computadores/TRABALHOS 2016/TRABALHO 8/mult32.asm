.data
msg: .asciiz "O resultado é: "

.text
	li $v0,0x12345678	# Multiplicando
	li $v1,0x80123456	# Multiplicador
	li $s0,0x0		# Produto
       #sll $v0,$v0,4		# Se utilizar numeros menores habilitar essa funcão, por ex: 11*13 = 143
loop:
	add $t1,$t1,1
	beq  $v1,0,end		# Se Multiplicador = 0 vai para o fim
	andi $t0,$v1,1		# Pega o valor do bit menos significativo do multiplicador
	bne $t0,0,soma1		# Se o bit menos significativo for diferente de 0 vai para soma1
	
	srl $s0,$s0,1		# Deslocamento do produto para a direita
	srl $v1,$v1,1		# Deslocamento do multiplicador para a direita
	beq $t0,0,loop		# Se $t0 for igual a 0 volta ao loop
soma1:
	add $s0,$s0,$v0		# Resultado armazenado no registrador $s0
	srl $s0,$s0,1		# Desloca o produto para a direita	
	srl $v1,$v1,1		# Desloca o multiplicador para a direita
	j loop			# Vai para o loop
end:	
	li $v0,4		# Printa uma string
	la $a0,msg		# Recebe a msg a ser printada
	syscall			# Chamada do sistema
	
	li $v0,35		# Printa o resultado em binario
	add $a0,$s0,$0		# Carrega o produto 
	syscall			# Chamada do sistema
	
	li $v0,35		# Printa o resultado em binario
	add $a0,$v1,$0		# Carrega o produto 
	syscall			# Chamada do sistema
