/**************************************************************** 
Register File 
-> contains 32 general purpose 32-bit registers (from x0 to x31) 
-> x0 is hardwired to 0. 
****************************************************************/ 

module regfile(fromReg1, fromReg2, toReg, rs2, rs1, rd, RegWrite, clk); 
  localparam bus_size = 32; 
  
  input[bus_size-1:0] toReg; 
  input[4:0] rs1, rs2, rd; 
  input RegWrite; 
  input clk; 
  output[bus_size-1:0] fromReg1, fromReg2; 
  
  reg[bus_size-1:0] regArray[0:31]; // an array of registers of length 32 
  supply0[bus_size-1:0] zero; 
  
  integer i; 
  initial begin 
    for (i=1; i<=31; i=i+1) regArray[i] <= 32'b0; 
  end 
  
  // continuously update output data buses from regfile 
  assign fromReg1 = regArray[rs1]; 
  assign fromReg2 = regArray[rs2]; 
  
  // x0 is hardwired to 0. 
  always @* regArray[0] = zero; 
  
  // if RegWrite is enabled only, update the reg specified by 'rd' with 'toReg' 
  always @(posedge clk) begin 
    if (RegWrite && rd) regArray[rd] <= toReg; 
  end 
  
endmodule // regfile 
