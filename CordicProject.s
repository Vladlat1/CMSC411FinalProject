.data
cordic_ctab: .word 2949120, 1740970, 919879,466945,234378,117303,58666,29334,14667,7333,3666,1833,916,458,229,114,57,28,14,7,3,1,0
cordic_const: .word 39799
counter: .word 0x00000000
loop_limit: .word 32
COS: .word 0x00000000               
SIN: .word 0x00000000
TAN: .word 0x00000000
theta: .word 0x0000F000 @Theta is 15 Degrees           

.text
.global main
main:
	