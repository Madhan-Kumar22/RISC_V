.text 
.main:   
	li a7, 4
	la a0, str1
	ecall
	li a7, 8
	la a0, infix
	li a1, 50
	ecall
	
	jal ra, infixToPrefix
	
	li a7, 4
	la a0, str2
	ecall
	li a7, 4
	la a0, infix
	ecall
	
	jal ra, infixToPostfix
	
	li a7, 4
	la a0, str3
	ecall
	li a7, 4
	la a0, infix
	ecall

infixToPrefix:
	#infixToPrefix conversion
	jalr ra

infixToPostfix:
	#infixToPostfix conversion
	jalr ra

.data
str1: .string  "Enter Infix expression: "
str2: .string "\nPrefix expression is: "
str3: .string "\nPostfix expression is: "
infix: .string 
prefix: .string 
postfix: .string 