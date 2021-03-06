module MIPS8(clk, rst, addr, datain, dataout, mem_we, INTR);
  // define inputs and outputs
  input clk, rst;
  input[1:0] INTR;
  input[7:0] datain;
  output[8:0] addr;
  output[7:0] dataout;
  output mem_we;
  
  // wires
  wire[1:0] srcB, addrSrc, enIR, srcA, regDst;
  wire[2:0] aluop, regSrc;
  wire[15:0] instr;
  wire[7:0] addr_p;
  
  // control unit
  Controller control_unit(clk, rst,
                          instr, INTR, seg,
                          enPC, enIR, enData, enFlags, we,
                          addrSrc, PCsrc, regSrc, regDst, srcA, srcB,
                          aluop, cin, mem_we, JR,
                          CF, VF, ZF, SF);
  
  // datapath
  Datapath datapath(clk, rst,
                    addr_p, datain, dataout, instr,
                    enPC, enIR, enData, enFlags, we,
                    addrSrc, PCsrc, regSrc, regDst, srcA, srcB,
                    aluop, cin, JR,
                    CF, VF, ZF, SF);
                    
  assign addr = {seg, addr_p};
endmodule