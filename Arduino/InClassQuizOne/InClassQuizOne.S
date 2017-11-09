#include "avr/io.h"


.global loop
.global setup
.global longTimer
.global shortTimer
.global again
.global Time
.global shortTime

L1: LDI R18, 100
L2: ldi r19, 250
L3:
    nop
    nop
    dec r19
    brne L3
    dec r18
    brne L2
    dec r17
    brne L1
ret

setup:
  ldi r16, 0b00100000
  sts DDRB, r16

shortBlink:
  ldi r17, 0b00100000
  sts PORTB, r17
  call shortTimer
  ldi r17, 0b00000000
  sts PORTB, r17
  call shortTimer
  jmp loop

loop:
  ldi r17, 0b00100000
  sts PORTB, r17
  call longTimer
  ldi r17, 0b00000000
  sts PORTB, r17
  call longTimer
  jmp shortBlink

longTimer:
  ldi r17, 250
shortTimer:
  ldi r17, 50

