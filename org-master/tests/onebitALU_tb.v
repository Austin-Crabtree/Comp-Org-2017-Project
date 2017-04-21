module alu_tb();
reg a_t, b_t, cin_t, less_t;
reg [2:0] op_t; // 3-bit operation code. op[2] is the "binv". op[0] is the
 // least significant bit.
//reg less_t; // This input will be set as 0 for all ALUs but the one
 //corresponding to the most-significant bit.
wire result_t; // The result of the ALU (depends on the operation that is
 // chosen)
//wire cout_t; // Carry out bit of the adder
wire g_t, p_t, set_t; // Generate and propagate signals that are to be used by the
 // CLA unit.


 OneBitALU alu(a_t, b_t, cin_t, less_t, op_t, result_t, cout_t, g_t, p_t, set_t);
 initial
 begin
 //case 1
 // a = 0
 // b = 0
 // c = 0
 // l = 1
 // op= 000
 a_t <= 0; b_t <= 0; cin_t <=0; op_t <= 3'b 000; less_t<=1; 
 #1 $display ("a = %b, b = %b, cin = %b,less= %b, op = %b, g = %b, p = %b, result = %b, set = %b",  a_t, b_t,cin_t,less_t, op_t, g_t, p_t, result_t, set_t);

  //case 2
 // a = 1
 // b = 0
 // c = 0
 // l = 1
 // op= 000
 a_t <= 1; b_t <= 0; cin_t <=0; op_t <= 3'b 000; less_t<=1; 
 #1 $display ("a = %b, b = %b, cin = %b,less= %b, op = %b, g = %b, p = %b, result = %b, set = %b",  a_t, b_t,cin_t,less_t, op_t, g_t, p_t, result_t, set_t);

  //case 3
 // a = 0
 // b = 0
 // c = 0
 // l = 1
 // op= 100
 a_t <= 0; b_t <= 0; cin_t <=0; op_t <= 3'b 100; less_t<=1; 
 #1 $display ("a = %b, b = %b, cin = %b,less= %b, op = %b, g = %b, p = %b, result = %b, set = %b",  a_t, b_t,cin_t,less_t, op_t, g_t, p_t, result_t, set_t);

  //case 4
 // a = 1
 // b = 1
 // c = 1
 // l = 1
 // op= 000
 a_t <= 1; b_t <= 1; cin_t <=1; op_t <= 3'b 000; less_t<=1; 
 #1 $display ("a = %b, b = %b, cin = %b,less= %b, op = %b, g = %b, p = %b, result = %b, set = %b",  a_t, b_t,cin_t,less_t, op_t, g_t, p_t, result_t, set_t);


  //case 5
 // a = 1
 // b = 1
 // c = 1
 // l = 1
 // op= 001
 a_t <= 1; b_t <= 1; cin_t <=1; op_t <= 3'b 001; less_t<=1; 
 #1 $display ("a = %b, b = %b, cin = %b,less= %b, op = %b, g = %b, p = %b, result = %b, set = %b",  a_t, b_t,cin_t,less_t, op_t, g_t, p_t, result_t, set_t);


  //case 6
 // a = 1
 // b = 1
 // c = 1
 // l = 1
 // op= 010
 a_t <= 1; b_t <= 1; cin_t <=0; op_t <= 3'b 010; less_t<=1; 
 #1 $display ("a = %b, b = %b, cin = %b,less= %b, op = %b, g = %b, p = %b, result = %b, set = %b",  a_t, b_t,cin_t,less_t, op_t, g_t, p_t, result_t, set_t);


  //case 7
 // a = 1
 // b = 1
 // c = 1
 // l = 1
 // op= 011
 a_t <= 1; b_t <= 1; cin_t <=1; op_t <= 3'b 011; less_t<=1; 
 #1 $display ("a = %b, b = %b, cin = %b,less= %b, op = %b, g = %b, p = %b, result = %b, set = %b",  a_t, b_t,cin_t,less_t, op_t, g_t, p_t, result_t, set_t);

 end
endmodule
