module ALU(a, b, y, s, cin, C, V, Z, S);
  parameter N = 8;
  
  // define inputs and outputs
  input[N-1:0] a, b;
  input[2:0] s;
  input cin;
  output[N-1:0] y;
  output C, V, Z, S;
  
  // Arithmetic
  wire[N-1:0] b1, y_arith, y_shift, y_logic;
  wire c_arith, v_arith, c_shift, v_shift;
  
  assign b1 = s[0]? ~b: b;
  
  Adder #(N) adder1(a, b1, cin, y_arith, c_arith, v_arith);
  
  // Shift
  assign y_shift = s[0]? (cin? {a[N-1], a[N-1:1]}: {1'b0, a[N-1:1]}): {a[N-2:0], 1'b0};
  assign v_shift = s[0]? a[7] ^ a[6]: (cin? 0: a[7]); 
  assign c_shift = s[0]? a[0]: a[N-1];
  
  // Logical Operations
  assign y_logic = s[1]? (s[0]? ~a: a ^ b): (s[0]? a | b: a & b);
  
  // assign y
  assign y = s[2]? y_logic: (s[1]? y_shift: y_arith);
  
  // set flags
  assign C = s[2]? 0: (s[1]? c_shift: c_arith);
  assign V = s[2]? 0: (s[1]? v_shift: v_arith);
  assign Z = y == 0;
  assign S = y[N-1];

endmodule