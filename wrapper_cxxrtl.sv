module wrapper_cxxrtl(input logic [31:0] in_0,input logic [31:0] in_1,input logic [31:0] in_2,output logic [31:0] out_0,output logic [31:0] out_1,output logic [31:0] out_2);

    logic [95:0] in_;
    logic [95:0] out_;
    assign in_[31:0] = in_0;    // 0x00020000
    assign in_[63:32] = in_1;   // 0x00000000
    assign in_[95:64] = in_2;   // 0x00000000
    assign out_0 = out_[31:0];
    assign out_1 = out_[63:32];
    assign out_2 = out_[95:64];
    top top_i(in_, out_);
endmodule
