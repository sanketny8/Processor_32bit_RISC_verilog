/*
Register_File:
Author: 2016eeb1087(sanket Nyayadhish)
Date: 26/12/2017
*/

module Register_File( input [3:0] A1,
                      input [3:0] A2,
                      input [3:0] A3,
                      input [31:0] D3,
                      input Reset,
                      input Clk,
                      input IsWb,
                      output [31:0] D1,
                      output [31:0] D2
                     );

wire [3:0] A1,A2,A3;
wire [31:0] D3;
wire Reset,Clk;
reg [31:0] D1,D2;
reg [31:0] R [15:0];
reg [15:0]ind;
wire IsWb;
//--------------------------------------
always @(Reset)
                   begin
if (Reset==1)
                   begin
                   for (ind=0;ind<16;ind=ind+1)
                   begin
                   if (ind!=14)
                   R[ind]  = 32'b0;
                   else 
                   R[ind]  = 32'h1000;
                   end
                   end
                   end
                   
                     always @(Clk or A1 or A2)
                     begin
                     if (Reset!=1 && Clk==0)                      // Getting operands from Register file
                     begin                     
                     D1 = R[A1];
                     D2 = R[A2];
                     end
                     end

                     always @(posedge Clk)
                     begin                                       // Storing Result in the Register file
                     if (Reset!=1 && IsWb==1)
                     R[A3] <= D3;
                     end

endmodule
