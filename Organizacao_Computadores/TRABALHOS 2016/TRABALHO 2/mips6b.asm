.text
li $t1,12	# Carregamos o 12 = 1 1 0 0 para o registrador $t1
li $t2,7	# Carregamos o 7 = 0 1 1 1 para o registrador $t2 -> Ser� utilizado como m�scara
and $t3,$t1,$t2	# Atrav�s do operador and temos como resultado 4 = 0 1 0 0 e salvamos no registrador $t3