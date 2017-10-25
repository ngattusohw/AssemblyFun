; 6 Write an assembly language program to do the following: get the number N from Data Space at 0x0100, add all numbers in [1, N], Output the lower byte
;of the result to Port B and the high byte of the result to Port C. (use register z to get number) (For example: if N is 5, do the adding 1+2+3+4+5) (Points 20)


.include "m328Pdef.inc"
init:
	.def max=r16
	.def counter=r17
	.def sum=r18
	
main:
	ldi max,15
	ldi counter,1
	clr sum
	
loop:
	cp max,counter
	brlo end
	add sum,counter
	inc counter
	rjmp loop
	
end: 
	out PORTB,sum