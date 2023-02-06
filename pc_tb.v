// testbench for pc 

module pc_tb(); 
  wire[31:0] Addr_; 
  reg clk; 
  reg[31:0] nextAddr_; 
  
  initial begin 
    clk = 0; 
    forever clk = #5 ~clk; 
  end 
  
  initial begin 
    nextAddr_ = #8 32'h00_00_00_00; 
    nextAddr_ = #8 32'h00_FF_00_00; 
    nextAddr_ = #8 32'h00_00_F1_02; 
    nextAddr_ = #8 32'hA0_00_00_08; 
  end 
  
  pc MUT(nextAddr_, clk, Addr_); 
  
endmodule // pc_tb 
