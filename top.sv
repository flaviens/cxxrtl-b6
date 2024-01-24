module top(input logic [31:0] in_0,input logic [31:0] in_1,input logic [31:0] in_2,output logic [31:0] out_0);

    // Naming convention: sig<id>_<binary_value>
    bit sig0_0;
    bit [1:0] sig1_01;
    bit [1:0] sig2_11;
    bit sig3_1;
    bit sig4_0;
    bit sig5_0;
    bit sig6_0;

    logic [95:0] in_;
    logic [95:0] out_;
    assign in_[31:0] = in_0;    // 0x00020000
    assign in_[63:32] = in_1;   // 0x00000000
    assign in_[95:64] = in_2;   // 0x00000000
    assign out_0 = out_[31:0];

    // 0
    assign sig0_0 = { sig3_1, 1'b0 } == { sig6_0, sig3_1 };
    // 1
    assign sig3_1 = 2'b01 > in_[63:62];
    // 0
    assign sig4_0 = 1'b1 <= sig1_01[1];
    // 11
    assign sig2_11 = in_[17:16] | { 1'b0, sig3_1 };
    // 0
    assign sig6_0 = ^ { sig3_1, sig3_1 };
    // 01
    assign sig1_01 = { sig0_0, 1'b0 } ^ { 1'b0, 1'b1 };
    // 0
    assign sig5_0 = sig4_0 & sig2_11[1];
    // 00
    assign { out_[32], out_[0] } = { 1'b0, sig5_0 };
    //   assign out_[0]  = sig5_0;
    //   assign out_[32] = 1'b0;

endmodule
