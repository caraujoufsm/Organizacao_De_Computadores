.text
.globl main
		
main:

la $t0,notas   # Carregamos o endereço base de notas
lw $s0,0($t0)  # $s0 <- Mem[notas]

andi  $t1, $s0, 0xFF00 # isolamos o byte nota1 de notas
srl   $t1, $t1, 8   # deslocamos nota1 para o byte menos significativo do registrador
la    $t0, nota1   # carregamos o endereço base de nota1
sw    $t1, 0($t0)   # guardamos em nota1 o valor de nota1


andi  $t1, $s0, 0x00FF # isolamos o byte nota2 de notas
la    $t0, nota2   # Carregamos o endereço base de nota2
sw    $t1, 4($t0)   # guardamos em nota2 o valor de nota2

.data
notas: .word 0x0809
nota1: .word 
nota2: .word
