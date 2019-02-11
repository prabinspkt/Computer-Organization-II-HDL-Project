module ALU4Bit(a, b, cin, less, op, result, cout, set, zero, g, p);
    input [3:0] a, b;
    input cin, less;
    input [2:0] op;
    output [3:0] result;
    output reg zero;
    output cout, set, g, p;
    wire g0, p0, g1, p1, g2, p2, g3, p3, c0, c1, c2, c3, c4, g, p, mst_sig_bit;
    supply0 gnd_wire;    

    // use ALI1Bit module for this addition to get value of result
    ALU1Bit alu_0(a[0], b[0], cin, less, op, result[0],,,, g0, p0);
    ALU1Bit alu_1(a[1], b[1], c1, gnd_wire, op, result[1],,,, g1, p1);
    ALU1Bit alu_2(a[2], b[2], c2, gnd_wire, op, result[2],,,, g2, p2);
    ALU1Bit alu_3(a[3], b[3], c3, gnd_wire, op, result[3],,mst_sig_bit,, g3, p3);

    // call CLA module here. supply the inputs and get the outputs
    CLA cla_0(g0, p0, g1, p1, g2, p2, g3, p3, cin, c0, c1, c2, c3, c4, g, p);

    // set zero to 1 if the result is 0000 but set it to 0 if the result is not 0000
    always @(result)
    begin
        if (result[3:0] == 4'b0000) begin
            zero = 1;
        end else begin
            zero = 0;
        end
    end

    assign set=mst_sig_bit;
    assign cout=c4;
endmodule