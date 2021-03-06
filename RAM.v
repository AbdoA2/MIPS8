module RAM(clk, rst, addr, datain, dataout, we);
  parameter N = 8;
  parameter M = 8;
  
  //define inputs and outputs
  input clk, rst, we;
  input[M-1:0] addr;
  input[N-1:0] datain;
  output[N-1:0] dataout;
  
  reg[N-1:0] ram[2**M-1:0];
  
  assign dataout = ram[addr];
  
  always @ (posedge clk)
    begin
      if (we == 1'b1)
        ram[addr] <= datain;
    end
    
  initial
    $readmemh("test5.tv", ram, 0, 25);
endmodule