;
; FirstProj.asm
;
; Created: 10/17/2017 11:58:35 PM
; Author : ngattuso
;


; Write an assembly language program to add up the numbers from 1 to 15
;(inclusive) and output the result to Port B (Points 15). 

.include "m328Pdef.inc"
init:
	.def i=r16
	.def n=r17
	.def sum=r18
	.def test=r19

	ldi test,0x02
	out PORTB,test
	
main:
	ldi i,1
	ldi n,0x02
	clr sum
	
loop:
	cp n,i
	brlo end
	mul i,i
	add sum,r0
	inc i
	rjmp loop
	
end: 
	ldi r20,0x01
	out PORTC,r20



