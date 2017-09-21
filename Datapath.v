module Datapath(clk, rst,
                addr, datain, dataout, instr,
                enPC, enIR, enData, enFlags, we,
                addrSrc, PCsrc, regSrc, regDst, srcA, srcB,
                aluop, cin, JR,
                CF, VF, ZF, SF);
  // define inputs and outputs
  input clk, rst;
  output CF, VF, ZF, SF;
  input[7:0] datain;
  output[15:0] instr;
  output[7:0] addr, dataout;
  input enPC, enData, we, cin, enFlags, PCsrc, JR;
  input[1:0] srcB, enIR, regDst, srcA, addrSrc;
  input[2:0] aluop, regSrc;
  
  // internal wires
  wire[7:0] wd3, ALUResult, ALUOut, a, b, nextPC, data, pc, sp, nextSP, input_a, input_b;
  wire[2:0] wa3;
  wire C, V, Z, S;
  
  // PC
  flopr #(8) PC(clk, rst, enPC, nextPC, pc); 
  
  // IR
  floprIR #(8) IR(clk, rst, enIR, datain, instr);
  
  // Data
  flopr #(8) DATA(clk, rst, enData, datain, data);
   
  // set address (instruction address or data address)
  assign addr = addrSrc[1]? instr[7:0]: (addrSrc[0]? b: pc);
  
  // set dataout
  assign dataout = a;
  
  // set Register File data input
  assign wd3 = regSrc[2]? pc: regSrc[1]? (regSrc[0]? instr[7:0]: b): (regSrc[0]? data: ALUOut);
  
  // set wa3
  assign wa3 = regDst[1]? instr[8:6]: regDst[0]? 3'b111: instr[11:9];
  
  // register file 
  RegFile #(.N(8), .M(3)) registers(clk, instr[11:9], instr[8:6], wa3, a,b, wd3, we);
  
  // ALU inputs
  assign input_a = srcA[1]? b: srcA[0]? pc: a;
  assign input_b = srcB[1]? instr[7:0] : (srcB[0]? 8'b1 : b);
  
  // ALU
  ALU #(8) alu(input_a, input_b, ALUResult, aluop, cin, C, V, Z, S);
  
  // ALUOut Register
  flopr #(8) ALUout(clk, rst, 1'b1, ALUResult, ALUOut);
  
  // flags register
  flopr #(4) Flags(clk, rst, enFlags, {C, V, Z, S}, {CF, VF, ZF, SF});
  
  // next PC
  assign nextPC = JR? b: (PCsrc? instr[7:0]: ALUResult);
  
endmodule