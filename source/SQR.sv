`timescale 1ps/1ps

module SQR (
  input logic[3:0] A,
  output logic[3:0] Z
);
  MMult Mult(.A(A), .B(A), .Z(Z));
endmodule