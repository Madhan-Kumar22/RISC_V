.text 
main:
	#create stack
	addi	sp,sp,-60
	#save s0
	sw	s0,60(sp)
	#update s0
	addi	s0,sp,60
	#init arr1[] to memory
	li	a5,6
	sw	a5,-60(s0)
	li	a5,8
	sw	a5,-56(s0)
	li	a5,2
	sw	a5,-52(s0)
	li	a5,2
	sw	a5,-48(s0)
	li	a5,4
	sw	a5,-44(s0)
	#init arr2[] to memory
	li	a5,3
	sw	a5,-40(s0)
	li	a5,7
	sw	a5,-36(s0)
	li	a5,0
	sw	a5,-32(s0)
	li	a5,9
	sw	a5,-28(s0)
	li	a5,1
	sw	a5,-24(s0)
	
	#adding the arrays and storing it in a new location
	lw t6, -60(s0)
	lw t5, -40(s0)
	add t4, t5, t6
	sw t4, -20(s0)
	
	lw t6, -56(s0)
	lw t5, -36(s0)
	add t4, t5, t6
	sw t4, -16(s0)
	
	lw t6, -52(s0)
	lw t5, -32(s0)
	add t4, t5, t6
	sw t4, -12(s0)
	
	lw t6, -48(s0)
	lw t5, -28(s0)
	add t4, t5, t6
	sw t4, -8(s0)
	
	lw t6, -44(s0)
	lw t5, -24(s0)
	add t4, t5, t6
	sw t4, -4(s0)
	
	#display array 1
	li a7, 4
	la a0, str1a
	ecall
	li a7, 1
	lw a0,-60(s0)
	ecall
	li a7, 4
	la a0, str3
	ecall
	li a7, 1
	lw a0,-56(s0)
	ecall
	li a7, 4
	la a0, str3
	ecall
	li a7, 1
	lw a0,-52(s0)
	ecall
	li a7, 4
	la a0, str3
	ecall
	li a7, 1
	lw a0,-48(s0)
	ecall
	li a7, 4
	la a0, str3
	ecall
	li a7, 1
	lw a0,-44(s0)
	ecall
	
	#display array 2
	li a7, 4
	la a0, str1b
	ecall
	li a7, 1
	lw a0,-40(s0)
	ecall
	li a7, 4
	la a0, str3
	ecall
	li a7, 1
	lw a0,-36(s0)
	ecall
	li a7, 4
	la a0, str3
	ecall
	li a7, 1
	lw a0,-32(s0)
	ecall
	li a7, 4
	la a0, str3
	ecall
	li a7, 1
	lw a0,-28(s0)
	ecall
	li a7, 4
	la a0, str3
	ecall
	li a7, 1
	lw a0,-24(s0)
	ecall
	
	#display array after addition
	li a7, 4
	la a0, str2
	ecall
	li a7, 1
	lw a0,-20(s0)
	ecall
	li a7, 4
	la a0, str3
	ecall
	li a7, 1
	lw a0,-16(s0)
	ecall
	li a7, 4
	la a0, str3
	ecall
	li a7, 1
	lw a0,-12(s0)
	ecall
	li a7, 4
	la a0, str3
	ecall
	li a7, 1
	lw a0,-8(s0)
	ecall
	li a7, 4
	la a0, str3
	ecall
	li a7, 1
	lw a0,-4(s0)
	ecall
	
	
.data 
str1a: .string "First array: "
str1b: .string "\nSecond array: "
str2: .string "\nArray after addition: "	
str3: .string ", "	
