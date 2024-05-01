`timescale 1ps/1ps
module tb_LDalu ();

  parameter PERIOD = 10;

  //Test Signals
  logic tb_clk = 0;

  //Clock
  always #(PERIOD/2) tb_clk++;

  //interface
  logic[11:0] A, B, R;
  logic op;

  //DUT
  LDalu DUT(.op(op), .A(A), .B(B), .R(R));


  integer tb_test_case;
  logic[11:0] expected_R;

  task check_outputs();
    @(negedge tb_clk);
    if(R == expected_R) begin
      $info("Correct R during test case %s", tb_test_case);
    end
    else begin
      $error("Incorrect R during test case %s", tb_test_case);
    end
  endtask 

  task setPoint(
    output logic[11:0] Point,
    input logic[3:0] X, Y, Z 
  );
    Point[3:0] = X;
    Point[7:4] = Y;
    Point[11:8] = Z;
  endtask

  initial begin
    //init
    tb_test_case = 0;
    op = 0;
    setPoint(A, 4'h0, 4'h0, 4'h0);
    setPoint(B, 4'h0, 4'h0, 4'h0);
    @(posedge tb_clk);


    // Test case 1
    // test point addition
    // 2P + P
    tb_test_case = 1;

    op = 0;
    setPoint(A, 4'b1000, 4'b0011, 4'b0001); //P
    setPoint(B, 4'b1110, 4'b0010, 4'b1100); //2P
    setPoint(expected_R, 4'b0111, 4'b0010, 4'b0010); //3P
    check_outputs();
    @(posedge tb_clk);

    // Test case 2
    // test point doubling
    // 2P
    tb_test_case = 2;

    op = 1;
    setPoint(A, 4'b1000, 4'b0011, 4'b0001); //set A to P
    setPoint(B, 4'h0, 4'h0, 4'h0); //set B to 0
    setPoint(expected_R, 4'b1110, 4'b0010, 4'b1100); //set out to 2P
    check_outputs();
    @(posedge tb_clk);
  end
endmodule