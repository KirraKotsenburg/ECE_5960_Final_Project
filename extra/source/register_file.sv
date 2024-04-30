`include "register_file_if.vh"
module register_file (
  input logic CLK, nRST,
  register_file_if.rf rfif
);
  logic[15:0][15:0] register;

  always_ff @( posedge CLK, negedge nRST ) begin : registers_ff
    if (nRST == 0) begin
      register <= 0;
    end
    else begin
      if (rfif.WEN) begin
        register[rfif.wsel] <= rfif.wdat
      end
    end
  assign rfif.rdat1 = register[rfif.rsel1];
  assign rfif.rdat2 = register[rfif.rsel2];

  end
endmodule