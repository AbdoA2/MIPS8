module floprIR(clk, rst, en, d, q);
  parameter N = 8;
  
  // define inputs and outputs
  input clk, rst;
  input[1:0] en;
  input[N-1:0] d;
  output[2*N-1:0] q;
  
  // sequential output
  reg[2*N-1:0] q;
  
  always @(posedge clk or posedge rst) 
    begin
      if (rst == 1)
        q <= 0;
      else if (en == 2'b01)
        q[N-1:0] <= d;
      else if (en == 2'b10)
        q[2*N-1:N] <= d;
    end
endmodule

