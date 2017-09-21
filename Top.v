module Top(clk, rst, dataout, we, INTR);
  // define inputs and outputs
  input clk, rst;
  output[7:0] dataout;
  input[1:0] INTR;
  output we;
  
  // define wires
  wire[8:0] addr;
  wire[7:0] datain;
  
  // MIPS8 processor
  MIPS8 mips8(clk, rst, addr, datain, dataout, we, INTR);
  
  // RAM
  RAM #(.N(8), .M(9)) ram(clk, rst, addr, dataout, datain, we);
  
endmodule