.text 
     mov r1,2
     mov r2,6
     cmp r2,r1
     bgt .exch
.loop:
      mod r5,r1,r2
      cmp r5,0
      beq .f
      mov r2,r5
       b .loop

.exch:
      mov r4,r1
      mov r1,r2
      mov r2,r4
      b .loop
.f:
 mov r0,r2
 .Exit:
