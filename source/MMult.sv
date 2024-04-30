`timescale 1ps/1ps
module MMult (
  input logic [3:0] A, B,
  output logic [3:0] Z
);
  logic [6:0] S;

always_comb begin : Multiplier
  S[0] = A[0] & B[0];
	S[1] = (A[1] & B[0]) ^ (A[0] & B[1]);
	S[2] = (A[2] & B[0]) ^ (A[1] & B[1]) ^ (A[0] & B[2]);
	S[3] = (A[3] & B[0]) ^ (A[2] & B[1]) ^ (A[1] & B[2]) ^ (A[0] & B[3]);
	S[4] = (A[3] & B[1]) ^ (A[2] & B[2]) ^ (A[1] & B[3]);
	S[5] = (A[3] & B[2]) ^ (A[2] & B[3]);
  S[6] = A[3] & B[3];

  Z[0] = S[0] ^ S[4];
  Z[1] = S[1] ^ S[4] ^ S[5];
  Z[2] = S[2] ^ S[5] ^ S[6];
  Z[3] = S[3] ^ S[6];
end

  // always_comb begin
  //   R[0] = A[0] & B[0];
  //   R[1] = (A[1] & B[0]) ^ (A[0] & B[1]);
  //   R[2] = (A[2] & B[0]) ^ (A[1] & B[1]) ^ (A[0] & B[2]);
  //   R[3] = (A[2] & B[1]) ^ (A[1] & B[2]);
  //   R[4] = A[2] & B[2];

  //   Z[0] = R[0] ^ R[3] ^ R[4];
  //   Z[1] = R[1] ^ R[4];
  //   Z[2] = R[2] ^ R[3] ^ R[4];
  // end
endmodule