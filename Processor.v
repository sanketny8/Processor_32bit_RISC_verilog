/*
Processor:
Author: 2016eeb1087(sanket Nyayadhish)
Date: 26/12/2017
*/
`timescale 1 ns/ 1 ns
`include "IF.v"
`include "OF.v"
`include "EX.v"
`include "MA.v"
`include "WB.v"
`include "Control.v"
`include "Register_File.v"
`include "Memory.v"
`include "Alu.v"
module Processor (
                   input Clk
                   );
 
wire Clk;
wire IsLd,IsSt,IsBeq,IsBgt,IsRet,IsImmediate,IsWb,IsUBranch,IsCall,I,IsBranchTaken;
wire [31:0] BranchPC,pc_current,Instruction,Immx,Op1,Op2,BranchTarget,AluResult,LdResult,Dm1,Dm2,D1,D2;
reg [31:0]A,B,Am1,Am2,Dm3,D3,PC;
reg [3:0] A1,A2,A3;
wire [4:0] AluSignal;
wire [4:0]Opcode;
wire [1:0] Flags;
wire [3:0] Rd;


integer ind1,i2,i3;
reg RW,Reset;
//-------------------------------------------

// ---------CREATING--INSTANCES--------------

     
     IF                    IF1(.PC(PC),.Clk(Clk),.IsBranchTaken(IsBranchTaken),.BranchPC(BranchPC),.pc_current(pc_current),.Instruction(Instruction) );
     OF                    OF1(.Instruction(Instruction),.pc_current(pc_current),.IsRet(IsRet),.IsSt(IsSt),.Opcode(Opcode),.I(I),.Immx(Immx),
                                   .BranchTarget(BranchTarget),.Op1(Op1),.Op2(Op2),.Rd(Rd));
     EX                    EX1(.IsRet(IsRet),.IsBeq(IsBeq),.IsBgt(IsBgt),.IsUBranch(IsUBranch),.IsImmediate(IsImmediate),.BranchTarget(BranchTarget),
                                    .AluSignal(AluSignal),.Op1(Op1),.Op2(Op2),.Immx(Immx),.AluResult(AluResult),
                                     .BranchPC(BranchPC),.IsBranchTaken(IsBranchTaken));
     MA                    MA1(.Op2(Op2),.AluResult(AluResult),.IsLd(IsLd),.IsSt(IsSt),.LdResult(LdResult));
     WB                    WB1(.Clk(Clk),.IsWb(IsWb),.IsCall(IsCall),.IsLd(IsLd),.Rd(Rd),.AluResult(AluResult),.LdResult(LdResult),.pc_current(pc_current));
     Control               C1 (.Opcode(Opcode),.I(I),.IsSt(IsSt),.IsLd(IsLd),.IsBeq(IsBeq),.IsBgt(IsBgt),.IsRet(IsRet),.IsImmediate(IsImmediate),
                                     .IsWb(IsWb),.IsUBranch(IsUBranch),.IsCall(IsCall),.AluSignal(AluSignal));
     Register_File         RF1 (.A1(A1),.A2(A2),.A3(A3),.D3(D3),.Reset(Reset),.Clk(Clk),.IsWb(IsWb),.D1(D1),.D2(D2) );
     Memory                M1  (.Am1(Am1),.Am2(Am2),.Dm3(Dm3),.RW(RW),.Dm1(Dm1),.Dm2(Dm2));
     Alu                   ALU1 (.AluSignal(AluSignal),.A(A),.B(B),.AluResult(AluResult),.Flags(Flags));                  
                   
initial
begin
 PC=32'd0;

 end
                     
                    
                     
 endmodule                     
                   
                   
                   
