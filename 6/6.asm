.text

la a0,str1 
li a7,4 	# displaying string 1
ecall

li a7,5  	#  taking input from user
ecall

add t0, x0, a0
addi t2, x0, 0
addi t5, x0, 0

la a0,str2
li a7,4		# displaying string 2
ecall



sum:
	
	add t2, t2, t5
	addi t5, t5,1	
	ble t5, t0, sum # looping till N elements

	

end:



add a2,t2,x0
jal ra, print_int
li a7,4
ecall

li a7,10
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
str1: .string "Enter number of integers: "
str2: .string "Sum of the integers are: "
str: .ascii  "00"