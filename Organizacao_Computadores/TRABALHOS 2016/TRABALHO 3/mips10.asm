.text
.globl main

main:
jal mostramensagem	# Pula para o procedimento mostramensagem
jal Recebe_Numero	# Pula para o procedimento Recebe_Numero
la $s1,0($v0)		# Carrega o primeiro numero para $s1
jal mostramensagem	# Pula para o procedimento mostramensagem
jal Recebe_Numero	# Pula para o procedimento Recebe_Numero
la $s2,0($v0)		# Carrega o segundo numero para $s2
jal mostramensagem	# Pula para o procedimento mostramensagem 
jal Recebe_Numero	# Pula para o procedimento Recebe_Numero
la $s3,0($v0)		# Carrega o terceiro numero para $s3
jal mostramensagem	# Pula para o procedimento mostramensagem
jal Recebe_Numero	# Pula para o procedimento Recebe_Numero
la $s4,0($v0)		# Carrega o quarto numero para $s4
jal MSGFIM		# Pula para o procedimento MSGFIM
jal Faz_soma		# Pula para o procedimento Faz_soma
jal FIM			# Pula para FIM

# Procedimento recebe variaveis
Recebe_Numero:
li $v0,5	# Ler um inteiro
syscall		# Chamada do Sistema	
jr $ra		# Retorna para uma instrução abaixo de onde foi chamado o procedimento

# Procedimento calcula soma
Faz_soma:
add $s5,$s1,$s2	# (1º+2º)
add $s5,$s5,$s3	# (1º+2º+3º)
add $s5,$s5,$s4	# (1º+2º+3º+4º)
li $v0,1	# Codigo para printar inteiro
la $a0,($s5)	# Carrega em $a0 o conteudo de $s5
syscall		# Chamada do sistema
jr $ra		# Retorna para uma instrução abaixo de onde foi chamado o procedimento

# Procedimento mostramensagem
mostramensagem:
li $v0,4	# Codigo para printar uma string
la $a0,msg	# Carrega para $a0 o conteudo de mensagem
syscall		# Chamada do sistema
jr $ra		# Retorna para uma instrução abaixo de onde foi chamado o procedimento

# Procedimento MSGFIM
MSGFIM:
li $v0,4	# Codigo para printar uma string
la $a0,msgf	# Carrega para $a0 o conteudo de msgf
syscall		# Chamada do sistema
jr $ra		# Retorna para uma instrução abaixo de onde foi chamado o procedimento

# Procedimento FIM
FIM:
#...

.data
msg:.asciiz "Informe o numero:"
msgf:.asciiz " A soma dos quatro numeros informados é: "
