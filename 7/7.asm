.text
li t0,36
li t1,24
j loop1

loop3:
	sub t0,t0,t1
	j loop5
  
 
loop4:
	sub t1,t1,t0
	j loop5	
 
  
loop1:
	bne t0,t1,loop2
	beq t0,t1,loop6
loop2:


	bgtu t0,t1,loop3

	
	bleu t0,t1,loop4

	
loop5:	
j loop1

loop6:

la a0,str1 
li a7,4 	# displaying string 1
ecall

add a0,t0,x0
li a7,1
ecall

.data
str1: .string "GCD of 36 and 24:"