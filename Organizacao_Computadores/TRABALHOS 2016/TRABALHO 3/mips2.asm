#a[10] = b[23] + c[11];
#b[45] = c[i] + 2;
#if (i==j) goto L1;
#c[j] = a[12] – 23;
#goto L2;
#L1:
#a[k] = b[j] + c[i];
#L2:
###[0] = a[k];

# $s4 <- i
# $s5 <- j
# $s6 <- k

.text 
.globl main

main:
la,$s1,VetorA	# Carrega o endereço base de VetorA
la $s2,VetorB	# Carrega o endereço base de VetorB
la $s3,VetorC	# Carrega o endereço base de VetorC

lw $t2,92($s2)	# $t2<- Recebe o valor de b[23]
lw $t3,44($s3)	# $t3<- Recebe o valor de c[11]

add $t4,$t2,$t3	# $t4 <- b[23] + c[11]
sw $t4,40($s1)	# a[10]<- b[23] + c[11]

sll $t5,$s4,2	# $t5 <- i*4
add $t5,$s3,$t5	# Endereço base de c[i] 
lw $t6,0($t5)	# $t6 <- c[i]

add $t1,$t6,2	# $t1 <- c[i] + 2
sw $t1,180($s2)	# b[45] <- c[i] + 2

beq $s4,$s5,L1

lw $t7,48($s1)	# $t7 <- a[12]
sub $t7,$t7,23	# $t7 <- a[12] - 23
sll $t1,$s5,2	# $t1 <- j*4
add $t1,$s3,$t1	# Endereço base de c[j]
sw $t7,0($t1)	# c[j] <- a[12] - 23
j L2

L1: # Label L1
sll $t1,$s5,2	# $t1<- j*4
add $t1,$s2,$t1	# Endereço base de b[j]
lw  $t0,0($t1)	# $t0 <- b[j]
add $t6,$t6,$t0	# $t6 <- c[i] + b[j]

sll $t0,$s6,2	# $t0 <- k*4
add $t0,$s1,$t0	# Endereço base de a[k]
sw $t6,0($t0)	# a[k] <- c[i] + b[j]
#j FIM <- Seria necessário para não entrar em L2, mas como não chama a FIM deixei comentado

L2: # Label L2
sll $t0,$s6,2	# t0 <- k*4
add $t0,$s1,$t0	# Endereço Base de a[k]
sw $t0,0($s1)	# Salva o conteudo de $t0 no endereço a[0]		

FIM: # Label FIM
#...											
.data
VetorA: .space 120
VetorB: .space 200
VetorC: .space 800
