/*
Control System:
Author: 2016eeb1087(sanket Nyayadhish)
Date: 26/12/2017
*/

module Control (
                 input [4:0] Opcode,
                 input I,
                 output IsSt,
                 output IsLd,
                 output IsBeq,
                 output IsBgt,
                 output IsRet,
                 output IsImmediate,
                 output IsWb,
                 output IsUBranch,
                 output IsCall,
                 output [4:0] AluSignal
                 );
                 
reg IsSt,IsLd,IsBeq,IsRet,IsImmediate,IsWb,IsUBranch,IsCall,IsBgt;
wire [4:0] Opcode;                 
wire I;
reg [4:0] AluSignal;

//------------------------------------------------------------

always @(*)
           begin
           
           if (I == 1)
           begin
           IsImmediate = 1;
           end
           else 
           IsImmediate = 0;
                    
case(Opcode)
5'b00000:                               //Arithmetic Operations
      begin                                         
       AluSignal = Opcode;
       IsWb      = 1;
       IsSt      = 0;
       IsLd      = 0;
       IsRet     = 0;
       IsUBranch = 0;
       IsCall    = 0;
       IsBeq     = 0;
       IsBgt     = 0;
      end
5'b00001: 
      begin
      if (I==1 && P.Immx[31])
      begin
      AluSignal = 5'b00000;
      end
      else
      begin
      AluSignal = Opcode;
      end
       IsWb      = 1;
       IsSt      = 0;
       IsLd      = 0;
       IsRet     = 0;
       IsUBranch = 0;
       IsCall    = 0;
       IsBeq     = 0;
       IsBgt     = 0;
      end

5'b00010: begin
       AluSignal = Opcode;
       IsWb      = 1;
       IsSt      = 0;
       IsLd      = 0;
       IsRet     = 0;
       IsUBranch = 0;
       IsCall    = 0;
       IsBeq     = 0;
       IsBgt     = 0;
       end

5'b00011: 
begin
       AluSignal = Opcode;
       IsWb      = 1;
       IsSt      = 0;
       IsLd      = 0;
       IsRet     = 0;
       IsUBranch = 0;
       IsCall    = 0;
       IsBeq     = 0;
       IsBgt     = 0;
end

5'b00100: 
begin
       AluSignal = Opcode;
       IsWb      = 1; 
       IsSt      = 0;
       IsLd      = 0;
       IsRet     = 0;
       IsUBranch = 0;
       IsCall    = 0;
       IsBeq     = 0;
       IsBgt     = 0;
end

5'b00101:
begin 
       AluSignal = Opcode;
       IsWb      = 0;
       IsSt      = 0;
       IsLd      = 0;
       IsRet     = 0;
       IsUBranch = 0;
       IsCall    = 0;
       IsBeq     = 0;
       IsBgt     = 0;
end

5'b00110:
begin
       AluSignal = Opcode;
       IsWb      = 1;
       IsSt      = 0;
       IsLd      = 0;
       IsRet     = 0;
       IsUBranch = 0;
       IsCall    = 0;
       IsBeq     = 0;
       IsBgt     = 0;
 end
 
5'b00111:
begin
       AluSignal = Opcode;
       IsWb      = 1;
       IsSt      = 0;
       IsLd      = 0;
       IsRet     = 0;
       IsUBranch = 0;
       IsCall    = 0;
       IsBeq     = 0;
       IsBgt     = 0;
 end
 
5'b01000:
begin
       AluSignal = Opcode;
       IsWb      = 1;
       IsSt      = 0;
       IsLd      = 0;
       IsRet     = 0;
       IsUBranch = 0;
       IsCall    = 0;
       IsBeq     = 0;
       IsBgt     = 0;
 end
 
5'b01001: 
begin
       AluSignal = Opcode;
       
       IsWb      = 1;
       IsSt      = 0;
       IsLd      = 0;
       IsRet     = 0;
       IsUBranch = 0;
       IsCall    = 0;
       IsBeq     = 0;
       IsBgt     = 0;
end

5'b01010:
begin
       AluSignal = Opcode;
       IsWb      = 1;
       IsSt      = 0;
       IsLd      = 0;
       IsRet     = 0;
       IsUBranch = 0;
       IsCall    = 0;
       IsBeq     = 0;
       IsBgt     = 0;
 end
5'b01011:
begin
       AluSignal = Opcode;
       IsWb      = 1;
       IsSt      = 0;
       IsLd      = 0;
       IsRet     = 0;
       IsUBranch = 0;
       IsCall    = 0;
       IsBeq     = 0;
       IsBgt     = 0;
 end
 
5'b01100: 
begin
       AluSignal = Opcode;
       IsWb      = 1  ;
       IsSt      = 0;
       IsLd      = 0;
       IsRet     = 0;
       IsUBranch = 0;
       IsCall    = 0;
       IsBeq     = 0;
       IsBgt     = 0;
end
               
5'b01101:
begin
       AluSignal = Opcode;
       IsWb      = 1;
       IsSt      = 0;
       IsLd      = 0;
       IsRet     = 0;
       IsUBranch = 0;
       IsCall    = 0;
       IsBeq     = 0;
       IsBgt     = 0;
 end
  
//-----------------------                                    //Branch Operations
5'b01110:
      begin
      AluSignal = 5'b00000;
      IsLd      = 1;
      IsWb      = 1;
      IsSt      = 0;
      IsRet     = 0;
      IsUBranch = 0;
      IsCall    = 0;
      IsBeq     = 0;
      IsBgt     = 0;
      end
5'b01111:
      begin
      AluSignal = 5'b00000;
      IsSt      = 1;
      IsWb      = 0;
      IsLd      = 0;
      IsRet     = 0;
      IsUBranch = 0;
      IsCall    = 0;
      IsBeq     = 0;
      IsBgt     = 0;
      end
5'b10000:begin
       AluSignal = 5'b01101;
       IsBeq     = 1;
       IsWb      = 0;
       IsSt      = 0;
       IsLd      = 0;
       IsRet     = 0;
       IsUBranch = 0;
       IsCall    = 0;
       end
5'b10001: 
begin
       AluSignal = 5'b01101;
       IsBgt     = 1;
       IsWb      = 0;
       IsSt      = 0;
       IsLd      = 0;
       IsRet     = 0;
       IsUBranch = 0;
       IsCall    = 0;
       end
5'b10010: 
begin
       AluSignal = 5'b01101;
       IsUBranch = 1;
       IsWb      = 0;
       IsSt      = 0;
       IsLd      = 0;
       IsRet     = 0;
       IsCall    = 0;
       end
5'b10011:
      begin
      AluSignal = 5'b01101;
      IsUBranch = 1;
      IsCall    = 1;
      IsWb      = 1;
      IsSt      = 0;
      IsLd      = 0;
      IsRet     = 0;
                
      end
5'b10100:           
      begin
      AluSignal = 5'b01101;
      IsUBranch = 1;
      IsRet     = 1;
      IsWb      = 0;
      IsSt      = 0;
      IsLd      = 0;
      IsCall    = 0;          
      end  
      
      endcase
      
      end
      endmodule
                  
