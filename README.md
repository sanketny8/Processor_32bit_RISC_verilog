# Processor_32bit_RISC_verilog

This is a simple RISC 32 bit processor made using Verilog.
This is based on the idea provided by dr.Smruti ranjan sarangi sir(IIT Delhi,Computer organisation and Architecture).

---------------------------------------------------------------------------------------------------------------------
# Description

  * This is Single cycle processor.
  * It has five stages mainly, 
  
  1. Instruction Fetch (IF)
  2. Operand Fetch     (OF)
  3. Execute           (EX)
  4. Memory Access     (MA)
  5. Writeback         (WB)
  -------------------------------------------------------------------------------------------------------------------
# Memory
 * It has 4KB of Random access memory.
 * Memory is 8 bits wide but processor access 32 bits (4B) for Operation.
---------------------------------------------------------------------------------------------------------------------

# Register
* It has 16 Registers.
* Out of those 14 (R0,R1....R13) are General purpose Register.
* R14 (Stack Pointer) and R15 (Return Address Register) are Special purpose register.
* Each Register is 32 bit wide and clock edge triggered. 
---------------------------------------------------------------------------------------------------------------------
# Instruction Set
* It has total 21 Instruction.
* out of which 13 are Arithmetic instructions and remaining are branch,load-store,call instruction.
Arithmetc Instructions:
 1. add
 2. sub
 3. mul
 4. div
 5. mod
 6. cmp
 7. and
 8. or
 9. not
10. mov
11. lsl
12. lsr
13. asr
* others:
1.nop
2.ld
3.st
4.beq
5.bgt
6.b
7.call
8.ret
--------------------------------------------------------------------------------------------------------------
# Assembly Program
   sample program:
 //FACTORIAL
.text
    
    mov r0,5              # Given Number in R0.
    mov r1,1              # Factorial of the number will be stored in R1.

.loop1:
       mul r1,r1,r0
       sub r0,r0,1
       cmp r0,1
       beq .EXIT
       b .loop1

.EXIT:
     
 ------------------------------------------------------------------------------------------------------------------  
# instructions to run
----------------------------------------------------------
* The assembly program has to be written in "program.asm" file in 
assembly language.
* The Hex file is "Input_Memory" which is read by the processor.
* The output i.e. Updated register file and updated memory is stored in "Updated_Memory" file.
----------------------------------------------------------
* The simulation time can be varied from the test processor file.








