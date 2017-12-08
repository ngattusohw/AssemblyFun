#define __SFR_OFFSET 0

#include "avr/io.h"
#include <avr/portpins.h>

.text
.global setup
.global loop


;;;this is basic code to just simply toggle the light on a button switch
setup:
  clr r17
  ser r18
  clr r19
  out DDRB, r18
  out PORTB, r17
  out DDRD, r17
  out PORTD, r17

 cpi r19, 2
  breq resetRandom
  inc r19
  
button1:
  inc r19
  sbis PIND, 2
  jump button2
  jmp rock
button2: 
  sbis PIND, 3 
  jmp paper
  sbis PIND, 4 
  jmp scissors
  jmp loop

resetRandom:
  ldi r19, 0
  jmp loop
 

rock: 
  cpi r19, 0
  breq tie
  cpi r19, 2
  breq win
  jmp lose

  
paper: 
  cpi r19, 1
  breq tie
  cpi r19, 0
  breq win
  jmp lose
  
scissors: 
  cpi r19, 2
  breq tie
  cpi r19, 1
  breq win
  jmp lose

tie:
  ldi r20, 0b00010000
  out PORTB, r20
  ret

win:
  ldi r16, 0b00100000
  out PORTB, r16
  ret
  
lose:
  ldi r21, 0b00001000 ;pin 11 (lose)
  out PORTB, r21
  ret

jmp loop
