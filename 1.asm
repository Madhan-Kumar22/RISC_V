.text
la a0,str1 
li a7,4 	# displaying string 1
ecall

li a7,5  	#  taking input from user
ecall

add t0, x0, a0


la a0,str2
li a7,4		# displaying string 2
ecall

add a0,t0,x0
li a7,1		# prints number
ecall


.data
str1: .string "Enter favorite number:"
str2: .string "Your favorite number is:"