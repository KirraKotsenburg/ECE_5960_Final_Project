/*********************
Point Doubling (Lopez Dahab)
*********************/
module pointDouble(
			input [3:0] X1,
			input [3:0] Y1,
			input [3:0] Z1,
			output wire [3:0] X2,
			output wire [3:0] Y2,
			output wire [3:0] Z2
);

	 // Constants a and b
	 wire[3:0]a, b;
	 
	 // TODO: Assign values to a, b (b != 0, elements of curve/field?)
	 assign a = 4'b0100;
	 assign b = 4'b0001;
	 
	 // Connecting wires
	 wire[3:0] Z1sqr, X1sqr, Y1sqr, Z1quad, X1quad, bZ1quad, aZ2, aZ2Y2, Y2paren, scndhalf, frsthalf, aZ2Y1sqr;
	 
	 
	// Z2 block (Z2 = Z1^2 * X1^2)
	 fourbit_SQR SQR1(.A(Z1), .Z(Z1sqr)); // Z1^2
	 fourbit_SQR SQR2(.A(X1), .Z(X1sqr)); // X1^2
	 fourbit_MMult MULT1(.A(Z1sqr), .B(X1sqr), .Z(Z2)); // Z1^2 * X1^2
	 
	// X2 block (X2 = X1^4 + b*Z1^4)
	 fourbit_SQR SQR3(.A(Z1sqr), .Z(Z1quad)); // Z1^4
	 fourbit_SQR SQR4(.A(X1sqr), .Z(X1quad)); // Z1^4
	 fourbit_MMult MULT2(.A(b), .B(Z1quad), .Z(bZ1quad)); // b*Z1^4
	 fourbit_ADD ADD1(.A(X1quad), .B(bZ1quad), .Z(X2)); // X1^4 + b*Z1^4
	 
	// Y2 Block (Y2 = (b*Z1^4) * Z2 + X2 * (a*Z2 + Y1^2 + (b*Z1^4))
	 // Parentheses
	 fourbit_SQR SQR5(.A(Y1), .Z(Y1sqr)); // Y1^2
	 fourbit_MMult MULT3(.A(a), .B(Z2), .Z(aZ2)); // a*Z2
	 fourbit_ADD ADD2(.A(aZ2), .B(Y1sqr), .Z(aZ2Y1sqr)); // a*Z2 + Y1^2
	 fourbit_ADD ADD3(.A(aZ2Y1sqr), .B(bZ1quad), .Z(Y2paren)); // (a*Z2 + Y1^2 + (b*Z1^4))
	 // Second half of Y2
	 fourbit_MMult MULT4(.A(X2), .B(Y2paren), .Z(scndhalf)); // X2 * (a*Z2 + Y1^2 + (b*Z1^4))
	 // First half
	 fourbit_MMult MULT5(.A(bZ1quad), .B(Z2), .Z(frsthalf)); // (b*Z1^4) * Z2
	 // Final addition
	 fourbit_ADD ADD4(.A(frsthalf), .B(scndhalf), .Z(Y2)); // (b*Z1^4) * Z2 + X2 * (a*Z2 + Y1^2 + (b*Z1^4)) = Y2
	 
	 


endmodule
