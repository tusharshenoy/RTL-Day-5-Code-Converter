module Code_Converter(code_in,select,code_out);
input [3:0]code_in;
input [1:0]select;
output reg[3:0]code_out;

always@(code_in,select)
    begin
        case(select)
             //Binary to Gray 
             2'b00:begin
                   code_out={code_in[3],code_in[3]^code_in[2],code_in[2]^code_in[1],code_in[1]^code_in[0]};
                   end
                   
              //BCD to Excess-3            
             2'b01:begin
                   if(code_in<4'b1010)
                      code_out=code_in+4'b0011;
                   else 
                      code_out=4'bxxxx;
                   end
            
             //Gray Code to Binary      
             2'b10:begin
                   code_out={code_in[3],code_in[3]^code_in[2],code_in[3]^code_in[2]^code_in[1],code_in[3]^code_in[2]^code_in[1]^code_in[0]};
                   end 
                   
             //Excess-3 to BCD             
             2'b11:begin
                   if(code_in>4'b0010&&code_in<4'b1101)
                     code_out=code_in-4'b0011;
                   else 
                     code_out=4'bxxxx;
                   end
             endcase

    end
    
endmodule
