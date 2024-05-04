# ECE_5960_Final_Project
4-bit Elliptic Curve Hardware Implementation by Kirra Kotesnburg and Kadon Stimpson

This project uses both Singular code and verilog for implementing 4-bit ECC and El Gamal encipherment.

Singular Files:

project.sing - This Singular file provides the elements of the finite field F_16 and uses the selected
irreducible polynomial to substitute and factorize in order to get the elliptic curve's points. There are 
two procedures included called pointAdd and pointDouble which use Lopez-Dahab projective coordinate formulas.
There is a third procedure called normalize which switched from projective coordinates to affine points.
These procedures generate all the points of the elliptic curve (2p, 3p,...) with a generative point.

ElGamal.sing - This Singular file performs el gamal encipherment. Using the same procedures from project.sing,
it is able to encrypt plaintext and then correctly decrypt ciphertext back into the original plaintext.
Selection of the private and publics keys is possible.

Verilog Files:
Module files found in source folder, testbenches in testbench folder.

MMult.sv - Mastrovito multiplier, it performs multiplication with modulo reduction mod(X^4 + X + 1) on two 4-bit inputs.
There is no carry out or in, the output is the 4-bit product of the inputs.

fourbit_ADD.v - Performs addition by bitwise XOR on two 4-bit inputs and outputs the 4-bit sum.

SQR.sv - Squares the 4-bit input. Is the same as an MMult.

pointADD.sv - Takes in two projective coordinates and performs point addition on them using the Lopez-Dahab formulas.
The inputs are the axis' of the points, each axis being 4-bits (6 inputs in total). The output is a point with three 
4-bit axis' (three outputs).

pointDouble.sv - Takes in one projective coordinate and performs point doubling using the Lopez-Dahab formulas.
The input is a three axis' point (three inputs in total) with each axis being 4-bits. The output is a point with three 
4-bit axis' (three outputs).

LDalu.sv - ALU that allows for selecting between pointDouble and pointADD. Has two 12-bit inputs and a 12-bit output, such that bits [0:3] represent X, [4:7] represent Y, and [11:8] represent Z.
Also has a 1-bit input for choosing which operation should be performed, with 0 being add and 1 being double.

tb_LDalu.sv - Testbench for both pointDouble and pointADD.

Other Files:

tb_LDalu.do - Script for running tests in Questa.

Report.pdf - Final report of project.

