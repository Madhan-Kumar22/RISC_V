main:   
	li a7, 4	# assigning call number to print string
	la a0, str	# a0 keeps the address of the string
	ecall		# System call
.data
str:      .string  "Hello World!\n" # String to print
