.text
main:
	#print str1
	la a0, str1
	li a7, 4
	ecall 
	
	li a7, 5
	ecall 
	add a2, x0, a0 # num = ?
	addi a3, a2, -1
	
	#print str2
	la a0, str2
	li a7, 4
	ecall 
	
	mainloop:
		jal ra, multiply_proc  #  call  multiply_proc
		add a2, a0, x0
		addi a3, a3, -1
		li a7, 1
		#ecall 
		bgt a3, x0, mainloop	# loop calculates a2 = n! 
	
	#print result
	addi a0, a2, 0 
	
	beqz a0, jumpz	#if n = 0 or 1
	
	li a7, 1
	ecall 
	li a7, 10
	ecall
	
	jumpz:	#if n = 0 or 1
		addi a0, x0, 1
		li a7, 1
		ecall 
		li a7, 10
		ecall
	
	
	
	
multiply_proc: # has a C declaration of: int multiply_proc(int,int);
	add t0, x0, a2	
	add t1, x0, a3
	beqz t0, jump0	#if a == 0 
	beqz t1, jump0	#if b == 0 
	bgtz t0, jump1  #if a > 0 
	bgtz t1, jump5	#if b > 0 
	
	#both are -ve
	loop4:
		addi t0, t0, 1
		addi t6, t6, 1
		bltz t0, loop4	
	add t4, t1, x0	
	loop5:
		addi t4, t4, 1
		addi t2, t2, 1
		bltz t4, loop5
	add t4, t2, x0
	loop6:
		addi t4, t4, -1
		add t5, t5, t6
		bgtz  t4, loop6
	add a0, t5, x0	
	jalr ra 
	
	jump0:	#atleast one of numbers is 0
		addi a0, x0, 0
		jalr ra
	jump1:	
		addi t6, x0, 1
		blt  t1, x0, jump2 #if b < 0
		beq t0, t6, jump3 #if a == 1
		beq t1, t6, jump4 #if b == 1
		#both are positive
		add t2, t0, x0
		loop:
			addi t2, t2, -1 
			add t3, t3, t1
			bgtz  t2, loop
		add a0, t3, x0	
		add t3, x0, x0
		jalr ra		
	jump3:	# a = 1	
		add a0, t1, x0
		jalr ra	
	jump4:	#b = 1
		add a0, t0, x0
		jalr ra	 
	jump2:  #if a > 0 and b < 0
		loop2:
			addi t0, t0, -1
			add t3, t3, t1
			bgtz t0, loop2
		add a0, t3, x0
		jalr ra		
	jump5: 	#if b > 0 and a < 0
		loop3:
			addi t1, t1, -1
			add t3, t3, t0
			bgtz t1, loop3
		add a0, t3, x0
		jalr ra	



.data 
str1: .string  "Enter number : "
str2: .string "\nFactorial result = "
		
		
	
	
	
	
	
	
	
	

