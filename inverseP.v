/*********************
Inverse of P circuit

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