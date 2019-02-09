module CLA(g0, p0, g1, p1, g2, p2, g3, p3, cin, c0, c1, c2, c3, c4, G, P);
    input g0, p0, g1, p1, g2, p2, g3, p3, cin;
    output c0, c1, c2, c3, c4, G, P;
    wire g0, p0, g1, p1, g2, p2, g3, p3, cin, c0, c1, c2, c3, c4, G, P; 
    assign P=(p0&p1&p2&p3);
    assign G=(g3|(p3&g2)|(p3&p2&g1)|(p3&p2&p1&g0));
    assign c0=cin,
        c1=g0|(p0&cin),
        c2=g1|(p1&g0)|(p1&p0&c0),
        c3=g2|(p2&g1)|(p2&p1&g0)|(p1&p1&p0&cin),
        c4=g3|(p3&g2)|(p3&p2&g1)|(p3&p2&p1&g0)|(p3&p2&p1&p0&cin);
endmodule