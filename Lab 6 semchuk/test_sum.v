`timescale 1ns/1ps

module test_sum;

wire Ci, cm, cr;
wire [5:0] Ain, Bin;
wire [5:0] res_my, res_ref;

reg [5:0] Ain_r, Bin_r;
reg Ci_r;

my_sum my_block (
    .Ain(Ain),
    .Bin(Bin),
    .Ci(Ci),
    .Sout(res_my),
    .Co(cm)
);

ref_sum ref_block (
    .Ain(Ain),
    .Bin(Bin),
    .Ci(Ci),
    .Sout(res_ref),
    .Co(cr)
);

initial begin
    $display("Time Ain Bin Ci res_my cm res_ref cr");
    $monitor($time, "  ", Ain, "  ", Bin, "  ", Ci, "  ", res_my, "  ", cm, "  ", res_ref, "  ", cr);
    #400 $finish;
end

initial begin
    Ain_r = 6'd1;
    #50 Ain_r = 6'd15;
    #50 Ain_r = 6'd25;
    #50 Ain_r = 6'd31;
    #50 Ain_r = 6'd40;
    #50 Ain_r = 6'd55;
    #50 Ain_r = 6'd63;
    #50 Ain_r = 6'd10;
end

initial begin
    Bin_r = 6'd2;
    #100 Bin_r = 6'd10;
    #100 Bin_r = 6'd20;
    #100 Bin_r = 6'd30;
end

initial begin
    Ci_r = 1'b0;
    #200 Ci_r = 1'b1;
end

assign Ain = Ain_r;
assign Bin = Bin_r;
assign Ci = Ci_r;

endmodule
