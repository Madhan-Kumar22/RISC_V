.text

addi t2, x0, 0
addi t5, x0, 0
addi t3, x0, 5 # N is 5


sum:
	
	add t2, t2, t5  # updating t2 by t5
	addi t5, t5,1	# increasing t5 by 1
	ble t5, t3, sum # looping till N elements

end:

la a0,str1
li a7,4
ecall

add a0,t2,x0
li a7,1
ecall

.data
str1: .string "Sum of the integers are:"
