/*
Memory Unit:
Author: 2016eeb1087(sanket Nyayadhish)
Date: 26/12/2017
*/

module Memory(
               input [31:0]Am1,
               input [31:0]Am2,
               input [31:0]Dm3,
               input  RW,
               output [31:0]Dm1,
               output [31:0]Dm2
              );

wire [31:0] Am1,Am2,Dm3;
wire RW;
reg [31:0] Dm1,Dm2;
reg [7:0] Mem [16'h1000:0];
integer ind;
reg [31:0] a1,a2;
 
//----------------------------
always @(Am1)
            begin
            a1   =  Am1;
            for(ind=0;ind<4;ind=ind+1)
            begin
            Dm1[8*ind +: 8] =  Mem[a1];
            a1 = a1 + 1 ;
            end
            end

always @(Am2)      
                            
            begin
            a2  =  Am2;
            if (RW == 0)
            begin
            for(ind=0;ind<4;ind=ind+1)
            begin
            Dm2[8*ind +: 8] =  Mem[a2];
            a2 = a2 + 1 ;
            end
            end
else if (RW == 1)
            begin
            for(ind=0;ind<4;ind=ind+1)
            begin
            Mem[a2] <= Dm3[8*ind +: 8];
            a2 = a2 + 1;
            end

            end
            end

endmodule

