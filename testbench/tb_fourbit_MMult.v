module tb_fourbit_MMult;
  
  // Inputs
  reg [3:0] A;
  reg [3:0] B;
  
  // Outputs
  wire [3:0] Z;
  
  // Instantiate the GFMult
  
  fourbit_MMult uut (
    .A(A),
    .B(B),
    .Z(Z)
  );
  
  //Instantiate GFMult for GFSQR function
//   fourbit_SQR  uut (
//    .A(A),
//    .Z(Z)
//  );
  
  
  
  // Clock set up
  reg clk;
  always #5 clk = ~clk;
  
  // Test stimulus
  initial begin
    // Initialize inputs
    A = 4'b0000;
    B = 4'b0000;
    
	 
	 // Testing for GFMult
    #10 A = 4'b0010; B = 4'b0100;
	 #20;
	 $display(" Test 1: A = %b, B = %b, Expected Z = 1000, Actual Z = %b", A, B, Z);
	 #10 A = 4'b0000; B = 4'b1111;
	 #20;
	 $display(" Test 2: A = %b, B = %b, Expected Z = 0000, Actual Z = %b", A, B, Z);
	 #10 A = 4'b0001; B = 4'b0111;
	 #20;
	 $display(" Test 3: A = %b, B = %b, Expected Z = 0111, Actual Z = %b", A, B, Z);
	 #10 A = 4'b1001; B = 4'b0001;
	 #20;
	 $display(" Test 4: A = %b, B = %b, Expected Z = 1001, Actual Z = %b", A, B, Z);
	 #10 A = 4'b0010; B = 4'b0011;
	 #20;
	 $display(" Test 5: A = %b, B = %b, Expected Z = 0110, Actual Z = %b", A, B, Z);
	 #10 A = 4'b0010; B = 4'b0010;
	 #20;
	 $display(" Test 6: A = %b, B = %b, Expected Z = 0100, Actual Z = %b", A, B, Z);
	 #10 A = 4'b0011; B = 4'b0011;
	 #20;
	 $display(" Test 7: A = %b, B = %b, Expected Z = 1001, Actual Z = %b", A, B, Z);
	 #10 A = 4'b0010; B = 4'b0010;
	 #20;
	 $display(" Test 8: A = %b, B = %b, Expected Z = 0100, Actual Z = %b", A, B, Z);
	 #10 A = 4'b0001; B = 4'b0001;
	 #20;
	 $display(" Test 9: A = %b, B = %b, Expected Z = 0001, Actual Z = %b", A, B, Z);
	 #10 A = 4'b0000; B = 4'b0000;
	 #20;
	 $display(" Test 10: A = %b, B = %b, Expected Z = 0000, Actual Z = %b", A, B, Z);
	 #10 A = 4'b1000; B = 4'b1000;
	 #20;
	 $display(" Test 11: A = %b, B = %b, Expected Z = 0000, Actual Z = %b", A, B, Z);
	 #10 A = 4'b0101; B = 4'b0101;
	 #20;
	 $display(" Test 12: A = %b, B = %b, Expected Z = 1001, Actual Z = %b", A, B, Z);
	 
	
	
	// Testing for GFSQR
//	 #10 A = 4'b0010;
//	 #20;
//	 $display(" Test 1 for A*A: A = %b, Expected Z = 0100, Actual Z = %b", A, Z);
//    #10 A = 4'b0001;
//	 #20;
//	 $display(" Test 2 for A*A: A = %b, Expected Z = 0001, Actual Z = %b", A, Z);
//	 #10 A = 4'b0011;
//	 #20;
//	 $display(" Test 3 for A*A: A = %b, Expected Z = 1001, Actual Z = %b", A, Z);
//	 #10 A = 4'b0111;
//	 #20;
//	 $display(" Test 4 for A*A: A = %b, Expected Z = 0001, Actual Z = %b", A, Z);
//	 #10 A = 4'b0101;
//	 #20;
//	 $display(" Test 5 for A*A: A = %b, Expected Z = 1001, Actual Z = %b", A, Z);
//	 #10 A = 4'b1000;
//	 #20;
//	 $display(" Test 5 for A*A: A = %b, Expected Z = 0000, Actual Z = %b", A, Z);
	
	 
    // Wait for a few clock cycles
    #10;
    
    // Display results
  
    
  end
  
  
endmodule
