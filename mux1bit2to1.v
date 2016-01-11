module mux1bit2to1(a, b, op, result);
input a, b, op;
output result;


assign result = (a & (~op)) | (b & op);			//multiplexer logic.

endmodule
