module OneBitALU(a, b, cin, less, op, result, cout, g, p, set);
input a, b, cin; // Inputs to the one-bit ALU, "cin" is the carry-in bit.
input [2:0] op;  // 3-bit operation code. op[2] is the "binv". op[0] is the
					  // least significant bit.
input less;      // This input will be set as 0 for all ALUs but the one
					  //corresponding to the most-significant bit.
output result;   // The result of the ALU (depends on the operation that is
					  // chosen)
output cout; 	  // Carry out bit of the adder
output g, p; 	  // Generate and propagate signals that are to be used by the
					  // CLA unit.
output set; 	  // This is the "sum" output of the full-adder.

reg result;
reg p, g;
reg cout;
reg bcomp;
reg set;
reg sum;

always @ (a or b or op or cin or less)
	begin
		if (op[2] ==1)
			begin
				 bcomp = ~b;
			end
		else if (op[2]==0)
			begin
				 bcomp = b;
			end
		 sum = (( a & bcomp) & cin) | (( ~a & bcomp) & ~cin) | (( ~a & ~bcomp) & cin) | ((a &~bcomp) & ~cin);
		 cout = ((a & bcomp)| (a&cin) | (bcomp & cin));
		 g = a & bcomp;
		 p = a | bcomp;
		 set = sum;
		case (op)
			3'b 000:  result = a & bcomp;
			3'b 001:  result = a | bcomp;
			3'b 010:  result = sum;
			3'b 110:  result = sum;
			3'b 111:  result = less;
		endcase
	end


endmodule
