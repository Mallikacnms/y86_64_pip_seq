`include "xor64.v"
module xor64_test;

reg signed [63:0] A, B;
wire signed [63:0] C;
integer i;
output overflow;
reg [1:0] control;

xor64 dut(.C(C),.A(A), .B(B),.overflow(overflow),.control(control));

initial begin
    
    $dumpfile("xor64_test.vcd");
    $dumpvars(0,xor64_test);
    A = 64'b0; B = 64'b0;

    $monitor("A = %b\nb = %b\nc = %b\n\n" , A, B, C);

    #100
    A = 64'b1111111111111111111111111111111111111111111111111111111111110000;
    B = 64'b1111111111111111111111111111111111111111111111111111111111111110;

    #100
    A = 64'b1111111111111111111111100001111111111111111111111111111111110000;
    B = 64'b1111111111111111111111111111111111110000111111111111111111111110;

     #100
    A = 64'b1111111111111111111111111111111100001111111111111111111111110000;
    B = 64'b1111111111111111111111111111110000111111111111111111111111111110;

    #100
    A = 64'b0111111111111111111101111111111111111111111111111111111111110000;
    B = 64'b1111111011111111111111111111111011111111111111111111111111111110;


end 
endmodule