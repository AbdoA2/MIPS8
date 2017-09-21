module FullAdder(a, b, cin, s, cout);
  // define inputs and outputs
  input a, b, cin;
  output s, cout;
  
  // calculate 1 bit addition
  assign s = a ^ b ^ cin;  // sum
  assign cout = (a & b) | (a & cin) | (b & cin);  // carry out
  
endmodule