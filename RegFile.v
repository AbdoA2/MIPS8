module RegFile(clk, a1, a2, wa3, d1, d2, wd3, we);
  parameter N = 8;
  parameter M = 2;
  
  // define inputs and outputs
  input clk;
  input[M-1:0] a1, a2, wa3;
  input we;
  output[N-1:0] d1, d2, wd3;
  
  // define register array
  reg[N-1:0] data[2**M-1:0];
  
  // assign outputs
  assign d1 = data[a1];
  assign d2 = data[a2];
  
  // write new data if any
  always @ (posedge clk)
    begin
      if (we == 1)
        data[wa3] <= wd3;
    end
    
  endmodule