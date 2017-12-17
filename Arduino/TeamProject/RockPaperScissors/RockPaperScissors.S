#define __SFR_OFFSET 0
#include "avr/io.h"

.text
.global setup
.global loop

setup:
  ser r16
  out DDRB,r16
  clr r17
  out PORTB,r17
  out DDRD,r17
  out PORTD,r17
  clr r18
  clr r19
  clr r21
  clr r20
      
loop:
main:
  cpi r19,127
  breq clear_19
back:
  inc r19
  sbis PIND,2
  jmp button1
  ldi r20,2
  jmp tmp
button1:
  sbis PIND,3
  jmp button2
  ldi r20,3
  jmp tmp
button2:
  sbis PIND,4
  jmp changer18
  ldi r20,4
tmp:
  cp r18,r16
  breq main
  call RPS
  clr r20
  ldi r18,0xFF
  jmp main
changer18:
  ldi r18,0x00
  jmp main
clear_19:
  clr r19
  jmp back

RPS:
  out PORTB,r17
  clr r21
  cpi r19,42
  brlt rock
  cpi r19,84
  brlt paper
  jmp scissors

rock:
  cpi r20,4
  breq tie
  cpi r20,2
  breq win
  jmp lose
paper:
  cpi r20,3
  breq tie
  cpi r20,4
  breq win
  jmp lose
scissors:
  cpi r20,2
  breq tie
  cpi r20,3
  breq win
  jmp lose

win:
  ldi r21,0b00001000
  out PORTB,r21
  ret
tie:
  ldi r21,0b00010000
  out PORTB,r21
  ret
lose:
  ldi r21,0b00100000
  out PORTB,r21
  ret

