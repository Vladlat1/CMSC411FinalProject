.data
cordic_ctab: .word 2949120, 1740970, 919879,466945,234378,117303,58666,29334,14667,7333,3666,1833,916,458,229,114,57,28,14,7,3,1,0
cordic_const: .word 39799
counter: .word 0x00000000
X: .word 0
Y: .word 0
Z: .word 0
loop_limit: .word 32
COS: .word 0x00000000               
SIN: .word 0x00000000
TAN: .word 0x00000000
theta: .word 0x000F0000 @Theta is 15 Degrees           

.text
.global main
main:
	ldr r0,=theta
	ldr r1, [r0]	@load value of theta into r1

	ldr r2, =cordic_const
	ldr r3, [r2]	@load X (constant) into r3

	ldr r4, =Y
	ldr r5, [r4]	@load Y ( 0 ) into r5


	mov r7,r1 	@load theta (0) into r7, z

	ldr r8, =counter
	ldr r9, [r8]	@load n into r9

	ldr r10, =loop_limit
	ldr r11, [r10]		@load 32 into r11 as the limit

	ldr r12, =cordic_ctab	@load tables first value
loop:
	cmp r9, r11		@check if we have hit the limit
	beq end_rot
	ldr r4,[r12]	@load table[n]
	add r12, #4		@increment table
	cmp r7,#0		@compare current angle to 0
	blt neg		
	mov r0, r5		
	lsr r0, r9		@shift Y by n
	mov r2, r3
	lsr r2, r9		@shift X by n
	sub r3, r3, r0 	@sub shifted y from x 
	add r5, r5, r2 	@add shifted x to y
	sub r7, r7,r4	@update current angle
	add r9,#1
	b loop

neg:
	mov r0, r5		
	lsr r0, r9		@shift Y by n
	mov r2, r3
	lsr r2, r9		@shift X by n
	add r3, r3, r0 	@sub shifted y from x 
	sub r5, r5, r2 	@add shifted x to y
	add r7, r7,r4	@update current angle
	add r9,#1
	b loop
	

end_rot:
	ldr r8, =COS
	str r3, [r8]
	add r8, #4
	str r5, [r8]



