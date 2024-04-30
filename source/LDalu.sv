`timescale 1ps/1ps
module LDalu (
  input logic[1:0] op,
  input logic[11:0] A, B,
  output logic[11:0] R 
);

logic[11:0] R_add, R_double;

pointADD ADD(.X0(A[3:0]), .Y0(A[7:4]), .Z0(A[11:8]), .X1(B[3:0]), .Y1(B[7:4]), .Z1(B[11:8]), .X2(R_add[3:0]), .Y2(R_add[7:4]), .Z2(R_add[11:8]));
pointDouble DOUBLE(.X1(A[3:0]), .Y1(A[7:4]), .Z1(A[11:8]), .X2(R_double[3:0]), .Y2(R_double[7:4]), .Z2(R_double[11:8]));

assign R = op ? R_double : R_add;

endmodule