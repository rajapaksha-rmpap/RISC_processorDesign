// testbench for RISC RV32I cpu 

module RISC_RV32I_cpu_tb(); 
  wire[31:0] instr, data, pc, MemAddr; 
  wire MemWrite, MemRead; 
  wire[1:0] addMemControl; 
  
  reg[31:0] instr_tb; 
  reg clk; 
  
  assign instr = instr_tb; 
  
  initial begin 
    clk = 0; 
    forever clk = #5 ~clk; 
  end 
  
  initial begin 
    instr_tb = #0  32'b0100000_00111_01000_000_00001_1100011; // BEQ
    instr_tb = #10 32'b0100000_00111_01000_001_00001_1100011; // BNQ 
    instr_tb = #10 32'b0100000_00111_01000_100_00001_1100011; // BEQ 
    instr_tb = #10 32'b0100000_00111_01000_101_00001_1100011; // BEQ 
    instr_tb = #10 32'b0100000_00111_01000_110_00001_1100011; // BEQ 
    instr_tb = #10 32'b0100000_00111_01000_111_00001_1100011; // BEQ 
  end 
  
  RISC_RV32I_cpu MUT(instr, data, pc, MemAddr, MemWrite, MemRead, addMemControl, clk); 
  
endmodule // RISC_RV32I_cpu_tb; 
