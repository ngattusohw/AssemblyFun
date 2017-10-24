;2) Store 10 numbers at data space 0x0100. Then retrieve the numbers using the
;register z and outputs 10 numbers from the memory to Port B. (Points 15).include "m328Pdef.inc"
init:
	ldi xh,high($0100)
	ldi xl,low($0100)

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
	out PortB,r22
	cpi zl,low($0100+10)
	brne loop
