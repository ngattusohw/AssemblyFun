.def i=r16
.def n=r17
.def sum=r18

ldi i,1
ldi n,2
ldi sum,0

loop:
	cp i,n
	brgt end
	mul i,j
	add sum,r0
	inc i
	jmp loop
end:
	nop
