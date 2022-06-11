module alu( input [0:15] A,B,
            input [0:4] Alu_Sel,
            output CarryOut,
            output [0:15] Alu_Out);

    reg [0:15] ALU_Result;
    wire [0:16] tmp;
    assign ALU_Out = ALU_Result; // ALU out
    assign tmp = {1'b0,A} + {1'b0,B};
    assign CarryOut = tmp[16]; // Carryout flag
    always @(*)
    begin
        case(Alu_Sel)
        4'b0000: // Addition
           ALU_Result = A + B ; 
        4'b0001: // Subtraction
           ALU_Result = A - B ;
        4'b0010: // Multiplication
           ALU_Result = A * B;
        4'b0011: // Division
           ALU_Result = A/B;
        4'b0100: // Logical shift left
           ALU_Result = A<<1;
         4'b0101: // Logical shift right
           ALU_Result = A>>1;
         4'b0110: // Rotate left
           ALU_Result = {A[0:14],A[15]};
         4'b0111: // Rotate right
           ALU_Result = {A[0],A[1:15]};
          4'b1000: //  Logical and 
           ALU_Result = A & B;
          4'b1001: //  Logical or
           ALU_Result = A | B;
          4'b1010: //  Logical xor 
           ALU_Result = A ^ B;
          4'b1011: //  Logical nor
           ALU_Result = ~(A | B);
          4'b1100: // Logical nand 
           ALU_Result = ~(A & B);
          4'b1101: // Logical xnor
           ALU_Result = ~(A ^ B);
          4'b1110: // Greater comparison
           ALU_Result = (A>B)?16'd1:16'd0 ;
          4'b1111: // Equal comparison   
            ALU_Result = (A==B)?16'd1:16'd0 ;
          default: ALU_Result = A + B ; 
        endcase
    end
endmodule