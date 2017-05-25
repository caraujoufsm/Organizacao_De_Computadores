.text
li $t1,4	# Carregamos 4 = 0 1 0 0  em $t1
li $t2,5	# Carregamos uma mascara 5 = 0 1 0 1 em $t2 
xor $t3,$t1,$t2	# Utilizando o operador xor, veremos que $t3 receberá o valor 1 = 0 0 0 1