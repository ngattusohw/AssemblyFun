

;Write an assembly language program to take the next two numbers in memory starting at data space 0x0100. Compare them and output the greater
;number (if the numbers are equal, output that number). (Points 15)

.include "m328Pdef.inc"

main:
	ldi zh,high($0100)
	ldi zl,low($0100)

	ld r22,z+
	out PortB,r22
	cpi zl,low($0100+2)
	ld r23,z+
	out PortB,r23