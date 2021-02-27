.text

        li t2,1
        li t3,1         # initial value
        
        
        la a0,str1 
	li a7,4 	# displaying string 1
	ecall
	
        li a7,5  	#  taking input from user
	ecall
	add t4, x0, a0
        
        
        la a0,str3 
	li a7,4 	# displaying string 3
	ecall
        
loop1:
        ble t3,t4,each
        bgt t3,t4,exit

fib:
        ble   a0, s0, L1       # if(n <= 1)
        addi  sp, sp, -12      # push the stack
        sw    ra, 8(sp)        # store return address
        sw    a0, 4(sp)        # store argument n
        addi  a0, a0, -1       # argument = n - 1
        jal   ra, fib          # call fib(n - 1)
        sw    a0, 0(sp)        # store return value of fib(n - 1)
        lw    a0, 4(sp)        # load argument n
        addi  a0, a0, -2       # argument = n - 2
        jal   ra, fib          # call fib(n - 2)
        lw    t0, 0(sp)        # load return value of fib(n - 1)
        add   a0, a0, t0       # fib(n - 1) + fib(n - 2)
        lw    ra, 8(sp)        # load return address
        addi  sp, sp, 12       # pop the stack
        ret                    # return
	
L1:
        ret                    # return

printResult:                   
        mv    t0, a0
        mv    t1, a1
       

        mv    a0, t1
        li    a7, 1
        ecall                  # print int result for each number
        
        la a0,str2             # printing space
	li a7,4
	ecall
	
        ret

each:
	    
	
        add    a0, t2,x0          # n = 1
        li    s0, 1            # for comparison with n (n <= 1)
        jal   ra, fib          # call fib(n)

        mv    a1, a0           # a1 : final value
    
        jal   ra, printResult  # print result

        addi t2,t2,1
        addi t3,t3,1
        j loop1



exit:
        li   a7, 10
        ecall                  # exit
        


.data

str1: .string "Enter N : "
str2: .string "  "
str3: .string "Fibonacci series till N numbers using recursion :"
