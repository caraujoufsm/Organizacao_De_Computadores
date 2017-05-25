.text
.globl	main
main:
la $s0, MatrizA # $s0 <- Endereço base da matriz A
la $s1, MatrizB # $s1 <- Endereço base da matriz B
la $s2, Matriz_Soma # $s2 <- Endereço base da matriz_soma
lw $t0,0($s0) # $t0 <- Endereço de Matriz A[0]
lw $t1,0($s1) # $t1 <- Endereço de Matriz B[0]
add $t2,$t1,$t0 # Faço a soma do primeiro elemento da matriz A com o primeiro elemento da matriz B e armazeno em $t2
sw $t2,0($s2) # Salvo na memória no endereço base da matriz soma o conteudo de $t2
lw $t0,4($s0) # $t0 <- Endereço de Matriz A[1]
lw $t1,4($s1) # $t1 <- Endereço de Matriz B[1]
add $t2,$t1,$t0 # Faço a soma do segundo elemento da matriz A com o segundo elemento da matriz B e armazeno em $t2
sw $t2,4($s2) # Salvo na memória no endereço base mais um deslocamento da matriz soma o conteudo de $t2
lw $t0,8($s0) # $t0 <- Endereço de Matriz A[2]
lw $t1,8($s1) # $t1 <- Endereço de Matriz B[2]
add $t2,$t1,$t0 # Faço a soma do terceiro elemento da matriz A com o terceiro elemento da matriz B e armazeno em $t2
sw $t2,8($s2) # Salvo na memória no endereço base mais dois deslocamentos da matriz soma o conteudo de $t2
lw $t0,12($s0) # $t0 <- Endereço de Matriz A[3]
lw $t1,12($s1) # $t1 <- Endereço de Matriz B[3]
add $t2,$t1,$t0 # Faço a soma do terceiro elemento da matriz A com o terceiro elemento da matriz B e armazeno em $t2 
sw $t2,12($s2) # Salvo na memória no endereço base mais três deslocamentos da matriz soma o conteudo de $t2

.data
MatrizA: .word 10,20,30,40
MatrizB: .word 50,60,70,80
Matriz_Soma: .space 16
