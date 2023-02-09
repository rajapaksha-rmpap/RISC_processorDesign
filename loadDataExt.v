/************************************************************************************
Load Data Extending Unit 
-> perform sign/unsign extensions on half-words and bytes loaded from the data memory 
************************************************************************************/ 

module loadDataExt(fromMem, funct3, dataIn); 
  localparam bus_size = 32; 
  input[bus_size-1:0] fromMem; 
  input[2:0] funct3; 
  output reg[bus_size-1:0] dataIn; 
  
  always @* begin 
    case (funct3) 
      (3'b000): dataIn = {{24{fromMem[7]}} , fromMem[7:0]};  // load byte (sign extended)
      (3'b001): dataIn = {{16{fromMem[15]}}, fromMem[15:0]}; // load half-word (sign extended)
      (3'b100): dataIn = {24'b0, fromMem[7:0]};              // load byte (zero extended)
      (3'b101): dataIn = {16'b0, fromMem[15:0]};             // load half-word (zero extended) 
      default:  dataIn = fromMem; 
    endcase 
  end 
  
endmodule // loadDataExt 