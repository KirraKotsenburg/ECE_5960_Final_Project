module tb_pointADD;
  
  // Inputs
  reg [3:0] X0;
  reg [3:0] Y0;
  reg [3:0] Z0;
  
  reg [3:0] X1;
  reg [3:0] Y1;
  reg [3:0] Z1;
  
  // Outputs
  wire [3:0] X2;
  wire [3:0] Y2;
  wire [3:0] Z2;
  
  //Instantiate pointADD
    pointADD uut(
    .X1(X1),
    .Y1(Y1),
    .Z1(Z1),
	 .X2(X2),
	 .Y2(Y2),
	 .Z2(Z2)
  );
  
  
  
  // Clock set up
  reg clk;
  always #5 clk = ~clk;
  
  // Test stimulus
  initial begin
    // Initialize inputs
	 X0 = 4'b0000;
    Y0 = 4'b0000;
	 Z0 = 4'b0000;
    
    X1 = 4'b0000;
    Y1 = 4'b0000;
	 Z1 = 4'b0000;
    
    
	 // Testing for pointADD
    #10 X0 = 4'b0010; Y0 = 4'b0001; Z0 = 4'b0001; X1 = 4'b0010; Y1 = 4'b0001; Z1 = 4'b0001;
	 #20;
	 $display("Test 1: X0 = %b, Y0 = %b, Z0 = %b, X1 = %b, Y1 = %b, Z1 = %b, Expected Output: X2 = 001, Y2 = 110, Z2 = 101", X0, Y0, Z0, X1, Y1, Z1);
	 $display("Actual Output X2 = %b, Y2 = %b, Z2 = %b", X2, Y2, Z2);
    #10 X0 = 4'b0010; Y0 = 4'b0001; Z0 = 4'b0001; X1 = 4'b0101; Y1 = 4'b0011; Z1 = 4'b0001;
	 #20;
	 $display("Test 2: X0 = %b, Y0 = %b, Z0 = %b, X1 = %b, Y1 = %b, Z1 = %b, Expected Output: X2 = 111, Y2 = 010, Z2 = 100", X0, Y0, Z0, X1, Y1, Z1);
	 $display("Actual Output X2 = %b, Y2 = %b, Z2 = %b", X2, Y2, Z2);
	 
    // Wait for a few clock cycles
    #10;
    
    // Display results
  
    
  end
  
  
endmodule