.text
.globl main

main:
#$s0 <- Menor parte do primeiro numero
lui $s0, 0x1234
ori $s0,$s0,0x5678
#$s1 <- Maior parte do primeiro numero
lui $s1, 0x1234
ori $s1,$s1,0x5678
#$s2 <- Menor parte do segundo numero
lui $s2, 0x1234
ori $s2,$s2,0x5678
#$s3 <- Maior parte do segundo numero
lui $s3, 0x8012
ori $s3,$s3,0x3456

# Somar $s0 com $s2, se tiver carry (1) adicionar com o operador maximo
add $s4,$s0,$s2
add $s5,$s1,$s3
# $s4<- Parte "baixa" do número de 64 bits e $s5<- Parte "alta" do número de 64 bits

#############################################################################
# Sem Sinal

li $v0, 4
la $a0,SS
syscall

li $v0,36
add $a0,$s5,$0
syscall

li $v0,36
add $a0,$s4,$0
syscall

li $v0, 4
la $a0, linha
syscall
##############################################################################
# Complemento de Dois
li $v0, 4
la $a0,c2
syscall

li $v0,1
add $a0,$s5,$0
syscall

li $v0,1
add $a0,$s4,$0
syscall

.data
c2: .asciiz "O numero em complemento de 2 é   :"
SS: .asciiz "O número representado sem sinal é: "
linha: .asciiz "\n" 
