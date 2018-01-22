/*
WB:
Author: 2016eeb1087(sanket Nyayadhish)
Date: 26/12/2017
*/

module WB (
           input Clk,
           input IsWb,
           input IsCall,
           input IsLd,
           input [3:0] Rd,
           input [31:0] AluResult,
           input [31:0] LdResult,
           input [31:0] pc_current
           );
         
wire IsWb,IsCall,IsLd,Clk;
wire [31:0] AluResult,LdResult,pc_current;
wire [3:0] Rd;

//--------------------------------------------------

           always @(*)
           begin
           #1
           if (IsWb == 1)
           begin  
               
           if (IsCall == 1)
           begin
           P.A3 = 4'b1111;
           end
           
           else if ( IsCall == 0)
           begin
            P.A3 = Rd;
           end
           
           if  (IsLd == 0 && IsCall == 0)
           begin
           P.D3 = AluResult ;
           end
           else if ( IsLd == 1 && IsCall == 0)
           begin
           P.D3 = LdResult;
           end
           else if (IsLd == 0 && IsCall == 1)
           begin
           P.D3 = pc_current + 4;
           end
           else
           begin
           P.D3 = AluResult ;
           end
           
           
           end
           end
           endmodule
           
           
     
