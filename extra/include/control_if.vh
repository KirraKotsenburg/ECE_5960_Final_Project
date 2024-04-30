`ifndef CONTROL_IF_VH
`define CONTROL_IF_VH

interface control_if;
  logic           WEN, aluop;
  logic[15:0]     instruction;

  // register file ports
  modport co (
    input  instruction,
    output WEN, aluop
  );
  // register file tb
  modport tb (
    input   WEN, aluop,
    output  instruction
  );
endinterface

`endif //CONTROL_IF_VH