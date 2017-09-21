@ ARM Assembly - exercise 4

	.text 	@ instruction memory
	
	
@ Write YOUR CODE HERE	

@ ---------------------	
@ fact:
fact:
	mov r6, #1 @product
	mov r7, #1 @j
loop:
	cmp r0,r7
	
	mul r8,r6,r7
	mov r6,r8
	add r7,r7, #1
	beq end
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

	@ calling the fact function
	mov r0, r4 	@the arg1 load
	bl fact
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
format: .asciz "Factorial of %d is %d\n"

