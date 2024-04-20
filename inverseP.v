/*********************
Inverse of P circuit
Inverse of point P
on Elliptic curve
*********************/
module inverseP(
        input x,
        input y,
        output wire invx,
        output wire invy
);


assign invx = x;
assign invy = x + y;


endmodule