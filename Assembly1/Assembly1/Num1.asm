; Write an assembly language program to add up the numbers from 1 to 15
;(inclusive) and output the result to Port B (Points 15). 


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