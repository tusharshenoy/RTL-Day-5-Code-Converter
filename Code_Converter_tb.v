module Code_Converter_tb();

reg [3:0]code_in;
reg [1:0]select;
wire [3:0]code_out;

Code_Converter dut(.code_in(code_in),.select(select),.code_out(code_out));

initial begin
   code_in=4'b1111;     //Initializing the Code_in to 1111

// Performs Binary to Gray code
    select=2'b00;    
      stimulus();
// Performs BCD to Excess-3 code
    select=2'b01;
      stimulus();
// Performs Gray Code to Binary   
    select=2'b01;
      stimulus();
// Performs Excess-3 code to Binary      
    select=2'b11;
     stimulus();
end

task stimulus;
    integer i;
        for(i=0;i<16;i=i+1)
            begin
                code_in=code_in+1'b1;
                #5;
            end
endtask
endmodule


