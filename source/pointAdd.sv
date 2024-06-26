`timescale 1ps/1ps
module pointAdd (
  input logic[3:0] X0,
  input logic[3:0] Y0,
  input logic[3:0] Z0,
  input logic[3:0] X1,
  input logic[3:0] Y1,
  input logic[3:0] Z1,
  output logic[3:0] X2,
  output logic[3:0] Y2,
  output logic[3:0] Z2
);
  // Constants a and b
  logic[3:0] a, b;
  
  assign a = 4'b0100;
  assign b = 4'b0001; // not used in formulas
  
  // Connecting Wires
  logic [3:0] A0, a0, A1, a1, B0, B1, C, c0, ch, D, E, F, G, g0, g1, g2, g3, H, I, i0, i1, i2, J, j0, y0, y1;
  logic [3:0] X_out, Y_out, Z_out;

  // Point Addition LD
  /*** A0 ***/
  SQR SQR1(.A(Z0), .Z(a0));
  MMult MULT1(.A(Y1), .B(a0), .Z(A0)); // A0
  
  /*** A1 ***/
  SQR SQR2(.A(Z1), .Z(a1));
  MMult MULT2(.A(Y0), .B(a1), .Z(A1)); // A1
  
  /*** B0 ***/
  MMult MULT3(.A(X1), .B(Z0), .Z(B0)); // B0
  
  /*** B1 ***/
  MMult MULT4(.A(X0), .B(Z1), .Z(B1)); // B1
  
  /*** C ***/
  fourbit_ADD ADD1(.A(A0), .B(A1), .Z(C)); // C
  
  /*** D ***/
  fourbit_ADD ADD2(.A(B0), .B(B1), .Z(D)); // D
  
  /*** E ***/
  MMult MULT5(.A(Z0), .B(Z1), .Z(E)); // E
  
  /*** F ***/
  MMult MULT6(.A(D), .B(E), .Z(F)); // F
  
  /*** Z2 ***/
  SQR SQR3(.A(F), .Z(Z_out)); // Z2
  
  /*** G ***/
  SQR SQR4(.A(D), .Z(g0)); // D^2
  SQR SQR5(.A(E), .Z(g1)); // E^2
  MMult MULT7(.A(a), .B(g1), .Z(g2)); // aE^2
  fourbit_ADD ADD3(.A(F), .B(g2), .Z(g3)); // F + g2
  MMult MULT8(.A(g0), .B(g3), .Z(G)); // G
  
  /*** H ***/
  MMult MULT9(.A(C), .B(F), .Z(H)); // H
  
  /*** X2 ***/
  SQR SQR6(.A(C), .Z(c0)); // C^2
  fourbit_ADD ADD4(.A(c0), .B(H), .Z(ch)); // C^2 + H
  fourbit_ADD ADD5(.A(ch), .B(G), .Z(X_out)); // X2
  
  /*** I ***/
  SQR SQR7(.A(D), .Z(i0)); // D^2
  MMult MULT10(.A(i0), .B(B0), .Z(i1)); // D^2 * B0
  MMult MULT11(.A(i1), .B(E), .Z(i2)); // D^2 * B0 * E
  fourbit_ADD ADD6(.A(i2), .B(X_out), .Z(I)); // I
  
  /*** J ***/
  MMult MULT12(.A(i0), .B(A0), .Z(j0)); // D^2 * A0
  fourbit_ADD ADD7(.A(j0), .B(X_out), .Z(J)); // J
  
  /*** Y2 ***/
  MMult MULT13(.A(H), .B(I), .Z(y0)); // H * I
  MMult MULT14(.A(Z_out), .B(J), .Z(y1)); // Z2 * J
  fourbit_ADD ADD8(.A(y0), .B(y1), .Z(Y_out)); // Y2

  always_comb begin
    //defaults
    X2 = X_out;
    Y2 = Y_out;
    Z2 = Z_out;

    //overrides
    if (Z0 == 0) begin //if point 0 is O, P + O = P
      X2 = X1;
      Y2 = Y1;
      Z2 = Z1;
    end
    if (Z1 == 0) begin //if point 1 is O, P + O = P
      X2 = X0;
      Y2 = Y0;
      Z2 = Z0;
    end
  end
endmodule