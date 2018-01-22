/*
EX:
Author: 2016eeb1087(sanket Nyayadhish)
Date: 26/12/2017
*/

module EX(
          input IsRet,
          input IsBeq,
          input IsBgt,
          input IsUBranch,
          input IsImmediate,
          input [31:0] BranchTarget,
          input [4:0] AluSignal,
          input [31:0] Op1,
          input [31:0] Op2,
          input [31:0] Immx,
          output [31:0] AluResult,
          output [31:0] BranchPC,
          output IsBranchTaken
          );
          
wire IsRet,IsBeq,IsBgt,IsUBranch,IsImmediate;
wire [4:0] AluSignal;
wire [31:0] Op1,Op2,Immx,BranchTarget;
reg [31:0] AluResult,BranchPC;
reg IsBranchTaken;
reg w1,w2;
//--------------------------------------------



always    @(*)
           begin
          
           IsBranchTaken = 0;
           if ( IsRet == 1)
           begin
           BranchPC = Op1;
           end
           else 
           begin
           BranchPC = BranchTarget;
           end
           
           if (IsBeq == 1 && P.Flags[0] == 1)
           begin
           w1 = 1;
           end
           else 
           begin
           w1=0;
           end
           
           if (IsBgt == 1 && P.Flags[1] == 1)
           begin
           w2 = 1 ;
           end
           else
           begin
           w2=0;
           end
           if (IsUBranch == 1 || w1 == 1 || w2 == 1 )
           begin
           
           IsBranchTaken = 1;
           end
           else
           begin
           IsBranchTaken = 0;
           end
 //--------------------------------------------- 
           P.A = Op1;
           
           if (IsImmediate == 1)
           begin
           P.B = Immx;
           end
           else
           begin
           P.B = Op2;
           end
           
         AluResult = P.ALU1.AluResult;
         end
         endmodule
           
           
           
           
           
           
           
