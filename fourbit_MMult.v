/*********************
4-bit Mastrovito Multiplier
Takes in two 4-bit inputs, multiplies
them, and outputs the product as 4-bit Z
*********************/
module fourbit_MMult(
    input [3:0]A,
    input [3:0] B,
    output reg[3:0] Z
    );

// Temporary reg
reg [6:0] S;

always@(*) begin
    	// Multiply A and B
	S[0] = A[0] & B[0];
	S[1] = (A[1] & B[0]) ^ (A[0] & B[1]);
	S[2] = (A[2] & B[0]) ^ (A[1] & B[1]) ^ (A[0] & B[2]);
	S[3] = (A[2] & B[1]) ^ (A[1] & B[2]) ^ (A[3] & B[0]) ^ (A[0] & B[3]);
	S[4] = (A[2] & B[2]) ^ (A[3] & B[1]) ^ (A[1] & B[3]);
	S[5] = (A[3] & B[2]) ^ (A[2] & B[3]);
   S[6] = A[3] & B[3];

	
	//Modulo operation With P(x) = x^4 + x^3 + 1
	Z[0] = S[0] ^ S[4] ^ S[5] ^ S[6];
	Z[1] = S[1] ^ S[5] ^ S[6];
	Z[2] = S[2] ^ S[6];
    Z[3] = S[3] ^ S[4] ^ S[5] ^ S[6];

end

endmodule 