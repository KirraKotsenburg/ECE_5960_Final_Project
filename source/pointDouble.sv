`timescale 1ps/1ps
module pointDouble(
  input logic [3:0] X1,
  input logic [3:0] Y1,
  input logic [3:0] Z1,
  output logic [3:0] X2,
  output logic [3:0] Y2,
  output logic [3:0] Z2
);

  // Constants a and b
  logic[3:0]a, b;
  
  assign a = 4'b0100;
  assign b = 4'b0001;
  
  // Connecting wires
  logic[3:0] Z1sqr, X1sqr, Y1sqr, Z1quad, X1quad, bZ1quad, aZ2, aZ2Y2, Y2paren, scndhalf, frsthalf, aZ2Y1sqr;
  logic[3:0] X_out, Y_out, Z_out;
  
  // Z2 block (Z2 = Z1^2 * X1^2)
  SQR SQR1(.A(Z1), .Z(Z1sqr)); // Z1^2
  SQR SQR2(.A(X1), .Z(X1sqr)); // X1^2
  MMult MULT1(.A(Z1sqr), .B(X1sqr), .Z(Z_out)); // Z1^2 * X1^2
  
  // X2 block (X2 = X1^4 + b*Z1^4)
  SQR SQR3(.A(Z1sqr), .Z(Z1quad)); // Z1^4
  SQR SQR4(.A(X1sqr), .Z(X1quad)); // Z1^4
  MMult MULT2(.A(b), .B(Z1quad), .Z(bZ1quad)); // b*Z1^4
  fourbit_ADD ADD1(.A(X1quad), .B(bZ1quad), .Z(X_out)); // X1^4 + b*Z1^4
  
  // Y2 Block (Y2 = (b*Z1^4) * Z2 + X2 * (a*Z2 + Y1^2 + (b*Z1^4))
  // Parentheses
  SQR SQR5(.A(Y1), .Z(Y1sqr)); // Y1^2
  MMult MULT3(.A(a), .B(Z_out), .Z(aZ2)); // a*Z2
  fourbit_ADD ADD2(.A(aZ2), .B(Y1sqr), .Z(aZ2Y1sqr)); // a*Z2 + Y1^2
  fourbit_ADD ADD3(.A(aZ2Y1sqr), .B(bZ1quad), .Z(Y2paren)); // (a*Z2 + Y1^2 + (b*Z1^4))
  // Second half of Y2
  MMult MULT4(.A(X_out), .B(Y2paren), .Z(scndhalf)); // X2 * (a*Z2 + Y1^2 + (b*Z1^4))
  // First half
  MMult MULT5(.A(bZ1quad), .B(Z_out), .Z(frsthalf)); // (b*Z1^4) * Z2
  // Final addition
  fourbit_ADD ADD4(.A(frsthalf), .B(scndhalf), .Z(Y_out)); // (b*Z1^4) * Z2 + X2 * (a*Z2 + Y1^2 + (b*Z1^4)) = Y2
  
  always_comb begin
    //defaults
    X2 = X_out;
    Y2 = Y_out;
    Z2 = Z_out;

    //overrides
    if (Z1 == 0) begin // when point1 = O, 2*O = O
      X2 = X1;
      Y2 = Y1;
      Z2 = Z1;
    end
  end


endmodule
