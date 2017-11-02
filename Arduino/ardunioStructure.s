#include "avr/io.h"
#define __SFR_OFFSET 0

.global loop
.global setup

setup:
	ldi r16,9
	ldi r17,0xFF
	ser r16
	out DDRB, r16

loop:
	out PORTB, r16

