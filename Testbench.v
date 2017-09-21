module Testbench();
  
  reg clk, rst;
  wire we;
  wire[7:0] dataout;
  
  initial
    begin
      clk <= 1;
      rst <= 1;
      #20;
      rst <= 0;
    end
    
  always
    #200 clk = ~clk;
    
  Top DUT(clk, rst, dataout, we, 2'b00);
  
  always @ (we)
    begin
      if (we == 1'b1)
        $display("dataout = %h", dataout);
    end
    
endmodule