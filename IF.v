/*
IF:
Author: 2016eeb1087(sanket Nyayadhish)
Date: 26/12/2017
*/
module IF(
          input [31:0]PC,
          input Clk,
          input IsBranchTaken,
          input [31:0] BranchPC,
          output [31:0] pc_current,
          output [31:0] Instruction
         );

wire [31:0] BranchPC,PC;
wire Clk,IsBranchTaken;
reg [31:0] Instruction;
reg [31:0] pc_current,pc_temp;
integer hal,ind = 0;

//-------------------------------------------------------------------------

                     
                     always @(negedge Clk )
                     begin
                     if( ind == 0)
                     begin
                     
                     pc_temp = PC;
                     pc_current = PC;
                     end
                     for (ind = 0;ind < 4;ind = ind + 1 )
                     begin
                     Instruction[8*ind +: 8] = P.M1.Mem[pc_temp];
                     pc_temp = pc_temp + 1;
                     end
                     
                     if(IsBranchTaken == 1)
                     begin
                     pc_current = BranchPC;
                     end
                     else
                     begin
                     pc_current = pc_temp - 4;
                     end
                                        
                     
                     end
                     
                     
                     
                     always @( IsBranchTaken )
                     begin                                                 // Waiting for IsBranchTaken Signal From Ex.
                     if (IsBranchTaken == 1)
                     begin
                     pc_temp = BranchPC;
                     end
                     else if ( IsBranchTaken == 0)
                     begin
                     pc_temp = pc_temp;
                     end
                                           
                     end
                     
endmodule

