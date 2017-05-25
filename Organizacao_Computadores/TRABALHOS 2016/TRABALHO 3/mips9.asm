.text
.globl main

main:
# $s0 <- x
li $t0,10	# $t0 <- 10
jal ler_numero	# Chama o procedimento ler_numero
la $s0,0($v0)	# Carrega o retorno do procedimento ler_numero para $s0
blt $s0,$0,mostramensagem	# Se o conteudo de $s0 < 0 chama o procedimento mostramensagem
bgt $s0,$t0,mostramensagem	# Se o conteudo de $s0 > 10 chama o procedimento mostramensagem
jal FIM		# Finaliza o programa

# procedimento leia um numero
ler_numero:
li $v0,5 # Codigo para ler um inteiro
syscall	# Chamada do sistema
jr $ra	# Retorna para uma instrução abaixo de onde foi chamado

# procedimento mostra mensagem
mostramensagem:
li $v0,4	# Codigo para printar uma string
la $a0,mensagem	# Carrega para $a0 o conteudo de mensagem
syscall		# Chamada do sistema

# procedimento fim
FIM:
#..
.data
mensagem: .asciiz "Erro!! O numero informado nao esta dentre os permitidos"
