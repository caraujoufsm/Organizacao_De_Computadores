.text
.globl main

main:
la $t0,A	# Carregamos a palavra A para o registrador $t0
lw $s0,0($t0)	# $s0 <- Mem[A]
la $t1,B	# Carregamos a palavra B para o registrador $t1
lw $s1,0($t1)	# $s1 <- Mem[B]

sll $t3,$s0,4
sll $t4,$s1,4

.data
A: .word 0x0A0A0A0A
B: .word 0xA0A0A0A0