

;Write an assembly language program to find the largest number in 15 binary numbers read from Data Space. Get the numbers from the Data Space starts
;from 0x0100. Output the result to Port B. (use register z to get number) (Points 20)

.include "m328Pdef.inc"
init:
	.def largest=r16

	ldi xh,high($0100)
	ldi xl,low($0100)

	ldi largest,0

load:
	st x+,r22
	inc r22
	cpi xl,low($0100+15)
	brne load

main:
	ldi zh,high($0100)
	ldi zl,low($0100)

loop:
	ld r22,z+
	cp r22,largest
	brge change
	cpi zl,low($0100+15)
	brne loop

change:
	mov largest,r22
	cpi zl,low($0100+15)
	brne loop

end:
	out PortB,largest