`timescale 1ns / 1ps

module Semchuk_ALB(

    input [3:0] R,
    input [3:0] S,
    input CI,

    input [2:0] H,
    input [1:0] I,

    output reg [3:0] Y,
    output reg [3:0] Y_norm,

    output reg CO,
    output reg VO,
    output reg NO,
    output reg ZO
);

// ??????????? ?? ??????? ????????
wire [4:0] add_res = R + S + CI;
wire [4:0] sub_res = R - S - 1 + CI;

wire [3:0] and_res = R & S;
wire [3:0] or_res  = R | S;


always @(*) begin

    // ????????? ???????
    Y = 4'b0000;
    Y_norm = 4'b0000;

    CO = 0;
    VO = 0;
    NO = 0;
    ZO = 0;


    // ??????? h2 h3 h1 = 011
    if (H == 3'b011) begin

        case (I)

            // SUB
            2'b00: begin

                Y = sub_res[3:0];

                CO = sub_res[4];

                VO = (R[3] != S[3]) && (Y[3] != R[3]);

            end


            // AND
            2'b01: begin

                Y = and_res;

            end


            // ADD
            2'b10: begin

                Y = add_res[3:0];

                CO = add_res[4];

                VO = (R[3] == S[3]) && (Y[3] != R[3]);

            end


            // OR
            2'b11: begin

                Y = or_res;

            end

        endcase
    end


    // ????????? ?????????
    NO = Y[3];


    // ???????? ?????????
    if (Y == 4'b0000)
        ZO = 1;
    else
        ZO = 0;


    // ???????????? ??????????
    if (Y[3] != Y[2])

        Y_norm = {Y[3], Y[3:1]};

    else

        Y_norm = Y;

end

endmodule
