/*********************
Point Addition (Lopez Dahab)
*********************/
module pointADD(
			input [3:0] X0,
			input [3:0] Y0,
			input [3:0] Z0,
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
	 assign b = 4'b0001; // not used in formulas

	 // Connecting wires
	 wire[3:0] A, a1, a2, Asqr, B, b1, C, D, d1, d2, d3, d4, E, EF, F, f1, Z2G, G, g1, h;
	 
	 // A = Y1 * Z0^2 +Y0
	 fourbit_SQR SQR1(.A(Z0), .Z(a1));
	 fourbit_MMult MULT1(.A(Y1), .B(a1), .Z(a2));
	 fourbit_ADD ADD1(.A(a2), .B(Y0), .Z(A));
	 
	 // B = X1 *Z0 + X0
	 fourbit_MMult MULT2(.A(X1), .B(Z0), .Z(b1));
	 fourbit_ADD ADD2(.A(b1), .B(X0), .Z(B));
	 
	 // C = Z0 *B
	 fourbit_MMult MULT3(.A(Z0), .B(B), .Z(C));
	 
	 // D = B^2 * ( C + a*Z0^2)
	 fourbit_SQR SQR2(.A(B), .Z(d1)); // B^2
	 fourbit_SQR SQR3(.A(Z0), .Z(d2)); // Z0^2
	 
	 fourbit_MMult MULT4(.A(a), .B(d2), .Z(d3)); // a*Z0^2
	 fourbit_ADD ADD3(.A(C), .B(d3), .Z(d4)); // ( C + a*Z0^2)
	 
	 fourbit_MMult MULT5(.A(d1), .B(d4), .Z(C)); // B^2 * ( C + a*Z0^2)
	 
	 // Z2 = C^2
	 fourbit_SQR SQR4(.A(C), .Z(Z2));
	 
	 // E = A * C
	 fourbit_MMult MULT6(.A(A), .B(C), .Z(E));
	 
	 
	 // X2 = A^2 + D + E
	 fourbit_SQR SQR5(.A(A), .Z(Asqr));
	 
	 fourbit_ADD ADD4(.A(Asqr), .B(D), .Z(h));
	 fourbit_ADD ADD5(.A(h), .B(E), .Z(X2));
	 
	 
	 // F = X2 + X1 * Z2
	 fourbit_MMult MULT7(.A(X1), .B(Z2), .Z(f1));
	 fourbit_ADD ADD6(.A(X2), .B(f1), .Z(F));
	 
	 // G = X2 + Y1 * Z2
	 fourbit_MMult MULT8(.A(Y1), .B(Z2), .Z(gi));
	 fourbit_ADD ADD7(.A(X2), .B(j), .Z(G));
	 
	 //Y2 = E * F + Z2 * G
	 fourbit_MMult MULT9(.A(E), .B(F), .Z(EF));
	 fourbit_MMult MULT10(.A(Z2), .B(G), .Z(Z2G));
	 fourbit_ADD ADD8(.A(EF), .B(Z2G), .Z(Y2));
	 
	 

endmodule
