/*********************
4-bit Adder circuit
Takes in two 4-bit inputs, performs bitwise
XOR on them (addition), and outputs the sum as 4-bit Z
*********************/
module 4b_ADD(
    input [3:0] A,
    input [3:0] B,
    output reg [3:0] Z
);

// GF addition is just a bitwise XOR
always@(*) begin
	Z[0] = A[0] ^ B[0];
	
	Z[1] = A[1] ^ B[1];
	
	Z[2] = A[2] ^ B[2];

    Z[3] = A[3] ^ B[3];
	
end

endmodule