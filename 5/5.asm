.text
main:
	la a0,str1 
	li a7,4 	# displaying string 1
	ecall

	li a7,5 	#  taking input from user
	ecall

	add a2,x0,a0

	la a0,str3
	li a7,4		# displaying string 3
	ecall
	
	jal ra, print_int	#calling print_int
	
	add t0, x0, a0		#storing address in t0
	
	li a7, 34	# displaying address in hexadecimal
	ecall
	
	la a0,str2
	li a7,4 	# displaying string 2
	ecall
	
	add a0, x0, t0  # displaying charecter
	li a7,4
	ecall
	
	li a7, 10
	ecall 

print_int:
	addi t1, x0, 10
	div t0, a2, t1 #finding 10s place digit
	mul t2, t0, t1
	sub t3, a2, t2 #finding 1s place digit
	
	addi t0, t0, 48 #conversion to ascii
	addi t3, t3, 48 #conversion to ascii
	
	la t4, str	#storing address of str in t1
	sb t0, (t4)	#entering ascii value to string
	sb t3, 1(t4)	#entering ascii value to string
	la a0, str	#storing address in a0
	
	jalr ra
	
	  

.data
str1: .string "Enter 2-digit number: "
str2: .string "\nString: " 
str3: .string "address of string: "
str: .ascii  "00"