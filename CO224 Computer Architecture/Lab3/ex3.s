@ ARM Assembly - exercise 3

	.text 	@ instruction memory

	
@ Write YOUR CODE HERE	

@ ---------------------	
@ Fibonacci:
Fibonacci:
	mov r6, #1 @j
	mov r7 , #0 @i
	mov r8, #1 @k
loop:
	cmp r0, r8
	beq end
	add r8,r8,#1

	add r9, r7, r6 @t=i+j
	mov r7,r6 @i=j
	mov r6,r9 @j=t
	b loop

end:
	mov r0,r6
	bx lr










@ ---------------------
	
	.global main
main:
	@ stack handling, will discuss later
	@ push (store) lr to the stack
	sub sp, sp, #4
	str lr, [sp, #0]

	mov r4, #8 	@the value n

	@ calling the Fibonacci function
	mov r0, r4 	@the arg1 load
	bl Fibonacci
	mov r5,r0
	

	@ load aguments and print
	ldr r0, =format
	mov r1, r4
	mov r2, r5
	bl printf

	@ stack handling (pop lr from the stack) and return
	ldr lr, [sp, #0]
	add sp, sp, #4
	mov pc, lr

	.data	@ data memory
format: .asciz "F_%d is %d\n"

