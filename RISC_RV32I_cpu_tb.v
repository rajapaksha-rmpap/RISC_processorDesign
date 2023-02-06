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
    instr_tb = #0   32'b0000000_01010_00000_000_00010_0010011; // ADDI 
    instr_tb = #10  32'b0000000_00100_00000_000_00100_0010011; // ADDI 
    instr_tb = #10  32'b0000000_00100_00010_000_00000_0110011; // ADD 
    instr_tb = #10  32'b0100000_00010_00100_000_00011_0110011; // SUB 
    /*
    instr_tb = #10 32'b0100000_00111_01000_001_00001_0110011; // BNQ 
    instr_tb = #10 32'b0100000_00111_01000_100_00001_1100011; // BEQ 
    instr_tb = #10 32'b0100000_00111_01000_101_00001_1100011; // BEQ 
    instr_tb = #10 32'b0100000_00111_01000_110_00001_1100011; // BEQ 
    instr_tb = #10 32'b0100000_00111_01000_111_00001_1100011; // BEQ 
    */ 
  end 
  
  RISC_RV32I_cpu MUT(instr, pc, data, data, MemAddr, MemWrite, MemRead, addMemControl, clk); 
  // instr, instrAddr, toMem, fromMem, MemAddr, EnWrite, EnRead, addMemControl, clk
  
endmodule // RISC_RV32I_cpu_tb; 
