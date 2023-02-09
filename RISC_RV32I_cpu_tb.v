// testbench for RISC RV32I cpu 

module RISC_RV32I_cpu_tb(); 
  wire[31:0] instr, dataOut, pc, MemAddr; 
  wire MemWrite, MemRead; 
  wire[1:0] addMemControl; 
  
  reg[31:0] instr_tb; 
  reg[31:0] dataIn; 
  reg clk; 
  
  assign instr = instr_tb; 
  
  initial begin 
    clk = 0; 
    forever clk = #5 ~clk; 
  end 
  
  initial begin 
    // Computational Operations (reg-imm type) 
    
    // loading values to reg 
    instr_tb = #0   32'b0000000_00001_00000_000_00001_0010011; // ADDI x0 + 1 -> x1
    instr_tb = #10  32'b0000000_00010_00000_000_00010_0010011; // ADDI x0 + 2 -> x2 
    instr_tb = #10  32'b1111111_11111_00000_000_11111_0010011; // ADDI x0 + -1 -> x31
    
    
    instr_tb = #10  32'b0000000_10100_11111_001_00011_0010011; // SLLI x31 << 20 -> x3 
    instr_tb = #10  32'b0000000_00001_11111_101_11101_0010011; // SRLI x31 >> 1 -> x29 => 2 147 483 647
    instr_tb = #10  32'b0100000_01000_00011_101_11110_0010011; // SRAI x3 >>> 8 -> x30 
    
    instr_tb = #10  32'b0000001_11110_11101_111_11010_0010011; // ANDI x29 & 111110 -> x26 
    instr_tb = #10  32'b1111111_11111_11110_100_11100_0010011; // XORI x30 ^ all 1's -> x28 
    instr_tb = #10  32'b0001100_01010_11100_110_11011_0010011; // ORI x28 | 110001010 -> x27 
    
    instr_tb = #10  32'b1111111_11111_11101_010_00001_0010011; // SLTI x30 and all 1's 
    instr_tb = #10  32'b1111111_11111_11101_011_00001_0010011; // SLTIU x30 and all 1's 
    
    // from t >= 110 
    // ********* Computational Operations (reg-reg type) *********** 
    instr_tb = #10  32'b0000000_00010_00001_000_00011_0110011; // ADD x1 + x2 -> x3 
    instr_tb = #10  32'b0100000_11111_00011_000_00100_0110011; // SUB x3 - x31 -> x4 
    instr_tb = #10  32'b0000000_11101_11110_111_10111_0110011; // AND x29 & x30 -> x23 
        // similarly OR and XOR reg-reg operations would work 
    
    instr_tb = #10  32'b0000000_11111_11111_001_11000_0110011; // SLL x31 << x31 -> x24 
        // similarly SRL and SRA reg-reg operations would work 
    
    instr_tb = #10  32'b1111100_11111_11000_011_00001_0110011; // SLL x31 << x31 -> x24 
        // similarly SLTU reg-reg operation would work 
        
    // ************* Branching Instructions ************ 
    //    conditional branchings 
    instr_tb = #10  32'b1111111_11100_11011_000_11101_1100011; // BEQ (x27, x28) T offset = -2 -> -4 
    instr_tb = #10  32'b1111111_11101_11000_001_11101_1100011; // BNE (x24, x29) T offset = -2 -> -4 
    
    // t >= 185  
    instr_tb = #10  32'b0000000_00100_00000_100_10100_1100011; // BLT (x0 < x4) T offset = +10 -> +20 
    instr_tb = #10  32'b1111111_11000_11110_101_10101_1100011; // BGE (x30 >= x24) T offset = -6 -> -12 
    instr_tb = #10  32'b1111111_11110_11111_110_11111_1100011; // BLTU (x31 < x30) F offset = -1 -> -2*
    instr_tb = #10  32'b0000000_00000_11001_111_01000_1100011; // BGEU (x25 >= x0) T offset = +4 -> +8
    
    //    unconditional branching 
    instr_tb = #10  32'b0_0000010100_0_00000000_00001_1101111; // JAL offset = +20 -> +40; pc + 4 -> x1
    instr_tb = #10  32'b0000000_00011_11010_000_00101_1100111; // JALR (x26 + 3)//2 -> pc; pc + 4 -> x5
     
    /*
    // ****************** Load and Store Instructions ********************** 
    instr_tb = #10  32'b0000000_00001_00010_010_00010_0100011; // SW x1 -> M[x2 + 2] = M[4] 
        // other storing SH and SB would work similarly 
    
    instr_tb = #10  32'b1111111_11111_00010_010_00011_0000011; // LW M[x2 + -1] = M[1] -> x3 
    dataIn = #2 32'b111; 
    
    /*
    instr_tb = #10 32'b0100000_00111_01000_001_00001_0110011; // BNQ 
    instr_tb = #10 32'b0100000_00111_01000_100_00001_1100011; // BEQ 
    instr_tb = #10 32'b0100000_00111_01000_101_00001_1100011; // BEQ 
    instr_tb = #10 32'b0100000_00111_01000_110_00001_1100011; // BEQ 
    instr_tb = #10 32'b0100000_00111_01000_111_00001_1100011; // BEQ 
    */ 
  end 
  
  RISC_RV32I_cpu MUT(instr, pc, dataOut, dataIn, MemAddr, MemWrite, MemRead, addMemControl, clk); 
  // instr, instrAddr, toMem, fromMem, MemAddr, EnWrite, EnRead, addMemControl, clk
  
endmodule // RISC_RV32I_cpu_tb; 
