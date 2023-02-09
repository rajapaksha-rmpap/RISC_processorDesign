// testbench for loaded data extending module 

module loadDataExt_tb(); 
  reg[31:0] fromMem; 
  reg[2:0] funct3; 
  wire[31:0] dataIn; 
  
  initial begin 
    fromMem <= #0 32'b00111110_01111110_00000100_01111111; 
    funct3 <= #0  3'b000; // load byte 
    funct3 <= #10 3'b001; // load half-word 
    funct3 <= #20 3'b010; // load word 
    funct3 <= #30 3'b100; // load byte (unsigned extended) 
    funct3 <= #40 3'b101; // load half-word (unsigned extended) 
  end 
  
  loadDataExt MUT(fromMem, funct3, dataIn); 
endmodule // loadDataExt_tb 
