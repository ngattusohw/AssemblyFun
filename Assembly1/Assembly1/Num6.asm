; 6 Write an assembly language program to do the following: get the number N from Data Space at 0x0100, add all numbers in [1, N], Output the lower byte
;of the result to Port B and the high byte of the result to Port C. (use register z to get number) (For example: if N is 5, do the adding 1+2+3+4+5) (Points 20)


.include "m328Pdef.inc"
init:
	.def n=r16
	.def counter=r17
	.def sum=r18
	.def sumHigh=r20
	.def hold=r12
	
main:
	ldi r19,15
	sts 0x0100,r19
	lds n,0x0100
	ldi counter,1
	clr sum
	clr sumHigh
	clr hold
	
loop:
	cp n,counter
	brlo end
	add sum,counter
	adc sumHigh,hold
	inc counter
	rjmp loop
	
end: 
	out PORTB,sum
	out PORTC,sumHigh