/*
Arithmetic and Logic Unit:
Author: 2016eeb1087(sanket Nyayadhish)
Date: 26/12/2017
*/
module Alu(
           input [4:0] AluSignal,
           input [31:0] A,
           input [31:0] B,
           output [31:0] AluResult,
           output [1:0] Flags
           );

wire [4:0] AluSignal;
wire signed [31:0] A,B;
reg [31:0] AluResult;
wire signed [31:0] A_signed;
reg [1:0] Flags;
assign A_signed=A;

//----------------------------------------
always @(*)
          begin
          case(AluSignal)

5'b00000 : AluResult = A + B ;// add
5'b00001 : AluResult = A - B ; // sub
5'b00010 : AluResult = A * B ; //mul
5'b00011 : AluResult = A / B ; //div 
5'b00100 : AluResult = A % B ; //mod
5'b00101 : begin
                if (A == B)
                begin 
                Flags[0] = 1'b1;
                Flags[1] = 1'b0;
                end  
                else if (A > B)
                begin
                Flags[0] = 1'b0; 
                Flags[1] = 1'b1;
                end
                else 
                begin
                Flags[0] = 1'b0; 
                Flags[1] = 1'b0;
                end
           end                        //cmp
5'b00110 : AluResult = A & B ; //and
5'b00111 : AluResult = A | B ; //or
5'b01000 : AluResult = ~A ;    //not
5'b01001 : AluResult =  B ;    // mov
5'b01010 : AluResult = A << B ;   //lsl
5'b01011 : AluResult = A >> B ; // A unsigned   //lsr
5'b01100 : 
          begin
          AluResult= A_signed >>> B;                     // A signed     //asr
          end
5'b01101:
          begin
           
          
          end
                   
default: begin
          AluResult = 32'd0;
          Flags[0] = 1'b0; 
          Flags[1] = 1'b0;
         end

endcase
end
endmodule
