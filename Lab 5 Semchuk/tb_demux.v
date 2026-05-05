`timescale 1ns/1ps

module tb_demux;

reg D;
reg [2:0] A;
reg EN;
wire [7:0] Q;

demux1to8 uut (
    .D(D),
    .A(A),
    .EN(EN),
    .Q(Q)
);

initial begin
    // ????????? ????????
    D = 0; A = 0; EN = 1;

    #10 EN = 0; D = 1;

    #10 A = 3'b000;
    #10 A = 3'b001;
    #10 A = 3'b010;
    #10 A = 3'b011;
    #10 A = 3'b100;
    #10 A = 3'b101;
    #10 A = 3'b110;
    #10 A = 3'b111;

    // ????????? Z
    #10 EN = 1;

    #10 $stop;
end

endmodule
