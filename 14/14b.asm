.data
infix: .string "a*b+c/d)"	#one extra bracket at end to detect end of string
infixr: .string "00000000" # e*d/c+b*a)
res: .string "0000000"
str: .string "Prefix: "
str2: .string "a*b+c/d\n\n"
str3: .string "Infix: "
str4: .string "\n" 
.text
reverse1:	#to reverse infix expression
	addi sp,sp,-1
	li t3,'!'
	sb t3,1(sp)
	li t5,')' 
	la t4, infix
	loop1:
		lb t6, 0(t4)
		addi sp,sp,-1
		sb t6,1(sp)
		addi t4, t4, 1
		add a0, t6, x0
		bne  t6, t5, loop1
	addi sp,sp,1
	la t4, infixr
	loop2:
		lb t6, 1(sp)
		beq t6, t3, jumps
		sb t6, 0(t4)
		addi sp, sp, 1
		addi t4, t4, 1
		bne t6, t3, loop2
	jumps:	
	li t0, ')'
	sb t0, 0(t4)
	la a0, infixr
	
main:
	la a0, str3
	li a7, 4
	ecall
	la a0, str2
	li a7, 4
	ecall
	la t6, res
	la a0, str
	li a7, 4
	ecall
	la t1,infixr
	addi sp,sp,-1
	li t3,'!'
	sb t3,1(sp)
	addi sp,sp,-1
	li t3,'('
	sb t3,1(sp)
loop:
	lb t2,1(sp)
	li t3,'!'
	beq t2,t3,done
	lb a1,0(t1)
	li t2,'('
	beq a1,t2,push
	li t2,'+'
	beq a1,t2,popadd
	li t2,'-'
	beq a1,t2,popadd
	li t2,'^'
	beq a1,t2,push
	li t2,'*'
	beq a1,t2,prod
	li t2,'/'
	beq a1,t2,prod
	li t2,')'
	beq a1,t2,pop
	jal print
	
push:	
	addi sp,sp,-1
	sb a1,1(sp)
	addi t1,t1,1
	jal loop
	
popadd:
	lb t3,1(sp)
	li t2,'('
	beq t2,t3,push
	lb a0,1(sp)
	sb a0, 0(t6)
	addi t6, t6, 1	
	addi sp,sp,1
	jal popadd	
	
pop:
	lb t3,1(sp)
	li t2,'('
	beq t2,t3,here
	lb a0,1(sp)
	sb a0, 0(t6)
	addi t6, t6, 1	
	addi sp,sp,1
	jal pop
	
	
	here:
		addi sp,sp,1
		addi t1,t1,1
		jal loop

prod:
	lb t3,1(sp)
	li t2,'+'
	beq t2,t3,push
	li t2,'-'
	beq t2,t3,push
	li t2,'('
	beq t2,t3,push
	lb a0,1(sp)
	sb a0, 0(t6)
	addi t6, t6, 1	
	addi sp,sp,1
	jal prod
	

print:
	lb a0,0(t1)
	sb a0, 0(t6)
	addi t6, t6, 1
	
	addi t1,t1,1
	jal loop
	
done:		
	li a7, 4
	li a0, ')'
	sb a0, 0(t6)
	addi t6, t6, 1
reverse2:	#to reverse res expression
	addi sp,sp,-1
	li t3,'!'
	sb t3,1(sp)
	li t5,')' 
	la t4, res
	loop3:
		lb t6, 0(t4)
		addi sp,sp,-1
		sb t6,1(sp)
		addi t4, t4, 1
		add a0, t6, x0
		bne  t6, t5, loop3
	
	la t4, infixr
	loop4:
		lb t6, 1(sp)
		beq t6, t3, jumpss
		sb t6, 0(t4)
		addi sp, sp, 1
		addi t4, t4, 1
		bne t6, t3, loop4
	jumpss:
	la a0, infixr
	addi a0, a0, 1
	li a7, 4
	ecall
	la a0, str4
	li a7, 4
	ecall	
