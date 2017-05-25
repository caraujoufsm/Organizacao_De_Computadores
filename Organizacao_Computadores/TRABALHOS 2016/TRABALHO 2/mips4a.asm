#a) a = b + c[3]

#s0 -> a
#s1 -> b

.text

main:
la $t0, vetor
lw $t1, 12($t0)
add $s0, $s1, $t1

.data
vetor: .space 4000
