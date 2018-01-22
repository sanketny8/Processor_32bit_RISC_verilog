/*
OF:
Author: 2016eeb1087(sanket Nyayadhish)
Date: 26/12/2017
*/

module  OF(
           input [31:0] Instruction,
           input [31:0] pc_current,
           input IsRet,
           input IsSt,
           output [4:0] Opcode,
           output I,
           output [31:0] Immx,
           output [31:0] BranchTarget,
           output [31:0] Op1,
           output [31:0] Op2,
           output [3:0]  Rd
                      );
           
wire [31:0] Instuction,pc_current;
wire IsRet,IsSt;
reg [4:0] Opcode;
reg I;
reg [3:0] Rd;
reg [31:0] Immx,BranchTarget,Op1,Op2;
reg  signed [15:0] Imm_temp;
reg signed [26:0] branch_temp;
//-------------------------------------------------------------

 
 always @(*)
 
            begin
            branch_temp = Instruction[26:0];
            Opcode      = Instruction[31:27];
            Rd          = Instruction[25:22];
            I           = Instruction[26];
            Imm_temp    = Instruction[15:0];
            if (I==1)
            begin
            if (Instruction[17:16] == 2'b00)
            begin
            Immx        = Imm_temp;
            end
            else if (Instruction[17:16] == 2'b01)      // u      
            begin
            Immx        = 32'd0;
            Immx        = Immx + Instruction[15:0];
            end
            else if (Instruction[17:16] == 2'b10)     // H
            begin
            Immx        = 32'd0;
            Immx        = Immx + Instruction[15:0];
            Immx        = Immx << 16;
            end
            end
           //---------------------------------
           
           branch_temp  = branch_temp << 2;
           BranchTarget = branch_temp;
           BranchTarget = BranchTarget + pc_current;
           //---------------------------------
           
           if (IsRet == 1)
           begin
           P.A1 = 4'b1111;
           end
           else 
           begin
           P.A1 = Instruction[21:18];
           end
           if ( IsSt == 1 )
           begin
           P.A2 = Instruction[25:22];
           end
           else
           begin
           P.A2 = Instruction[17:14];
           end
           //----------------------------------
           Op1 = P.D1;
           Op2 = P.D2;
           end
           
          endmodule          
