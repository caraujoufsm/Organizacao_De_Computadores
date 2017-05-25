# i = 0;
# j = 1;
# k = 2;
# l = 3;

# a[i] = b[j]+c[k]+d[l]
# Supondo que i,j,k,l estejam em registradores

#$s0 <- i
#$s1 <- j
#$s2 <- k
#$s3 <- l

li $s0,0	# i = 0
li $s1,1	# j = 1
li $s2,2	# k = 2
li $s3,3	# l = 3

# a[i] = b[j] + c[k] + d[l]

la $t0, VetorB	# t0<- Endereço base de Vetor B
# carregamos b[j]
add $t1,$s1,$s1	# $t1<-j*2
add $t1,$t1,$t1	# $t1<-j*4
add $t1,$t0,$t1	# $t1<- Endereço de b[j]
lw $t3,0($t1)	# $t3<- b[j]

la $t1, VetorC	# t0<- Endereço base de Vetor C
# carregamos c[k]
sll $t2,$s2,2 # $t2<-k*4
add $t2,$t1,$t2 # $t2<- Endereço base de c[k]
lw $t4, 0($t2) # $t4<- c[k]
# fazemos a soma de b[j] com c[k]
add $t3,$t3,$t4 # $t3<- b[j]+c[k]

la $t2, VetorD # $t2<- Endereço base de Vetor D
# carregamos d[l]
sll $t5,$s3,2 # $t5<-l*4 
add $t5,$t2,$t5 # $t5<- Endereço base de d[l]  
lw $t6,0($t5) # $t6<-d[l]
# fazemos a soma de b[j]+c[k] com d[l]
add $t6,$t3,$t6 # $t6<- b[j]+c[k]+d[l]

la $t3, VetorA # $t3 <- Endereço base de Vetor A
# carregamos a[i]
sll $t0,$s0,2 # $t0<-i*4
add $t0,$t3,$t0 # $t0<- Endereço base de a[i]
sw $t6, 0($t0) # a[i] <- b[j]+c[k]+d[l]

.data
VetorA: .space 4000
VetorB: .space 4000
VetorC: .space 4000
VetorD: .space 4000 
