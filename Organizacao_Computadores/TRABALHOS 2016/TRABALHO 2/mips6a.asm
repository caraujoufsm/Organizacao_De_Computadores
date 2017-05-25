.text
li $t2,4	# Carregamos o número 4 para o registrador $t2 -> 4 = 0 1 0 0
li $t3,8	# Carregamos o número 8 para o registrador $t3 -> 8 = 1 0 0 0 / Utilizamos o 8 como máscara para setar o bit
or $t1,$t2,$t3	# Utilizamos o operador or para setar o bit mais significativo do número 0 1 0 0.
