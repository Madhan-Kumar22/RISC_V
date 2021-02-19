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



add a0,t2,x0
li a7,1
ecall


.data
str1: .string "Enter number of integers: "
str2: .string "Sum of the integers are: "