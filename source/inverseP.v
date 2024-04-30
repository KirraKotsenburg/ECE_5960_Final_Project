/*********************
Inverse of P circuit
Inverse of point P
on Elliptic curve
*********************/
module inverseP(
        input [3:0] X,
        input [3:0] Y,
		  input [3:0] Z,
        output wire [3:0] invX,
        output wire [3:0] invY,
		  output wire [3:0] invZ
);


assign invX = X;

fourbit_ADD ADD1(.A(X), .B(Y), .Z(invY));

assign invZ = Z;

endmodule
