module Adder(a, b, cin, s, cout, v);
  // define parameters
  parameter N = 8;
  
  // define inputs and outputs
  input[N-1:0] a, b;
  input cin;
  output[N-1:0] s;
  output cout, v;
  
  // adder
  wire[7:0] c;
  // first adder
  FullAdder f0(a[0], b[0], cin, s[0], c[0]);
  
  // rest of adders
  genvar i;
  generate
    for (i = 1; i < N; i = i+1) begin
      FullAdder f(a[i], b[i], c[i-1], s[i], c[i]);
    end
  endgenerate
  
  // set C, V
  assign cout = c[N-1];
  assign v = c[N-1] ^ c[N-2];
  
endmodule 
