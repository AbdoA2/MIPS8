module flopr(clk, rst, en, d, q);
  parameter N = 8;
  
  // define inputs and outputs
  input clk, rst, en;
  input[N-1:0] d;
  output[N-1:0] q;
  
  // sequential output
  reg[N-1:0] q;
  
  always @(posedge clk or posedge rst) 
    begin
      if (rst == 1'b1)
        q <= 0;
      else if (en == 1'b1)
        q <= d;
    end
endmodule