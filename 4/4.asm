.text

#print str1
la a0, str1
li a7, 4
ecall 

li a7, 5
ecall 

add t0, x0, a0 # N = ?
addi t1, x0, 0 # a = 0
addi t2, x0, 1 # b = 1

#print str2
la a0, str2
li a7, 4
ecall 

#print 0
li a0, 0
li a7, 1
ecall 

beq t0,x0,jump0 # if( N == 0 )

addi t4, x0, 2	# i = 2;
loop:
	add t3, t1, t2 #c = a + b;
	add t1, x0, x0	
	add t1, t2, x0 #a = b; 
	add t2, x0, x0
	add t2, t3, x0 #b = c; 
	
	#print str3
	la a0, str3
	li a7, 4
	ecall 

	#print c
	add a0, t3, x0
	li a7, 1
	ecall 
	
	addi t4, t4, 1 # i++
	ble t4, t0, loop # while( i <= N )

jump0:

.data 
str1: .ascii "Enter number of elements in "
str2: .ascii "fibonacci series:"
str3: .ascii "  "

