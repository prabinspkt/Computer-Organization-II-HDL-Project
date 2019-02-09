module ALU4Bit(a, b, cin, less, op, result, cout, set, zero, g, p);
    input [3:0] a, b;
    input cin, less;
    input [2:0] op; // TODO: don't know the use of this input
    output [3:0] result;
    output cout, set, zero, g, p;
    wire g0, p0, g1, p1, g2, p2, g3, p3, c0, c1, c2, c3, c4, g, p;

    // calculate the values of g0, p0, g1, p1, g2, p2, g3, p3 based on the inputs a and b
    assign g0=(a[0]&b[0]), g1=(a[1]&b[1]), g2=(a[2]&b[2]), g3=(a[3]&b[3]);
    assign p0=(a[0]|b[0]), p1=(a[1]|b[1]), p2=(a[2]|b[2]), p3=(a[3]|b[3]);

    // call CLA module here. supply the inputs and get the outputs
    CLA(g0, p0, g1, p1, g2, p2, g3, p3, cin, c0, c1, c2, c3, c4, g, p);

    // use ALI1Bit module for this addition to get value of result
    

    // set zero to 1 if the result is 0000 but set it to 0 if the result is not 0000
    if (result == 4'b0000) begin
        zero = 1;
    end else begin
        zero = 0;
    end

    // TODO: not sure if 'assign' keyword is necessary here
    assign set=result[3];
    assign cout=c4;
endmodule