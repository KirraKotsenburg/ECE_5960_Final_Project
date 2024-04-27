/*********************
4-bit Mastrovito Multiplier modified for squaring operation
Takes in one 4-bit input, squares
it, and outputs the product as 4-bit Z
*********************/
module fourbit_SQR(
    input [3:0]A,
    output reg[3:0] Z
    );

// Temporary reg
reg [6:0] S;

always@(*) begin
    	// Square A
	S[0] = A[0] & A[0];
	S[1] = (A[1] & A[0]) ^ (A[0] & A[1]);
	S[2] = (A[2] & A[0]) ^ (A[1] & A[1]) ^ (A[0] & A[2]);
	S[3] = (A[3] & A[0]) ^ (A[2] & A[1]) ^ (A[1] & A[2]) ^ (A[0] & A[3]);
	S[4] = (A[3] & A[1]) ^ (A[2] & A[2]) ^ (A[1] & A[3]);
	S[5] = (A[3] & A[2]) ^ (A[2] & A[3]);
   S[6] = (A[3] & A[3]);
	//$display("S6 = %b, S5 = %b, S4 = %b, S3 = %b, S2 = %b, S1 = %b, S0 = %b", S[6], S[5], S[4], S[3], S[2], S[1], S[0]);
	
//	//Modulo operation With P(x) = x^4 + x + 1
//	Z[0] = S[0] ^ S[4] ^ S[5] ^ S[6];
//	Z[1] = S[1] ^ S[4] ^ S[6];
//	Z[2] = S[2] ^ S[6];
//   Z[3] = S[3];

	//Modulo operation With P(x) = x^4 + x + 1
	Z[0] = S[0] ^ S[4] ^ S[5] ^ S[6];
	Z[1] = S[1] ^ S[4] ^ S[6];
	Z[2] = S[2] ^ S[5] ^ S[6];
   Z[3] = S[3] ^ S[5] ^ S[6];

end

endmodule 