
;4) Write an assembly language program to add any 15 binary numbers. Get the numbers from the Data Space starts from 0x0100. Output the lower byte of
;the result to Port B and the high byte of the result to Port C. (use register z to get number). (Points 15)

.include "m328Pdef.inc"
init:
	.def sumLow=r16
	.def sumHigh=r17
	.def hold=r18

	ldi xh,high($0100)
	ldi xl,low($0100)

	ldi sumLow,0
	ldi sumHigh,0
	ldi hold,0

load:
	st x+,r22
	inc r22
	cpi xl,low($0100+10)
	brne load

main:
	ldi zh,high($0100)
	ldi zl,low($0100)

loop:
	ld r22,z+
	add sumLow,r22
	adc sumHigh,hold
	cpi zl,low($0100+10)
	brne loop

end:
	out PortB,sumHigh
	out PortC,sumLow

