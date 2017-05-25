.text

main:
la $t0, VetorB  # <- Endereço base VetorB
lw $t1, 24($t0) # $t1<-b[6]
la $t2, VetorC # <- Endereço base VetorC
lw $t3, 800($t2) # $t3<-c[200]
add $t4,$t3,$t1 #t4<- c[200]+b[6]
la $t5, VetorA # <- Endereço base VetorA
sw $t4, 16($t5) # a[4] <- b[6]+c[200]

.data
VetorA: .space 4000 
VetorB: .space 4000
VetorC: .space 4000