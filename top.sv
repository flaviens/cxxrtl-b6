module top(in_data, out_data);
  bit celloutsig_17z;
  bit [1:0] celloutsig_20z;
  bit [1:0] celloutsig_27z;
  bit celloutsig_2z;
  bit celloutsig_38z;
  bit celloutsig_84z;
  bit celloutsig_9z;
  input [95:0] in_data;
  bit [95:0] in_data;
  output [95:0] out_data;
  bit [95:0] out_data;
  // 0
  assign celloutsig_17z = { celloutsig_2z, 1'b0 } == { celloutsig_9z, celloutsig_2z };
  // 0
  assign celloutsig_2z = 2'b01 > in_data[63:62];
  // 0
  assign celloutsig_38z = 1'b1 <= celloutsig_20z[1];
  // 11
  assign celloutsig_27z = in_data[17:16] | { 1'b0, celloutsig_2z };
  // 0
  assign celloutsig_9z = ^ { celloutsig_2z, celloutsig_2z };
  // 01
  assign celloutsig_20z = { celloutsig_17z, 1'b0 } ^ { 1'b0, 1'b1 };
  // 0
  assign celloutsig_84z = celloutsig_38z & celloutsig_27z[1];
  // 00
  assign { out_data[32], out_data[0] } = { 1'b0, celloutsig_84z };
//   assign out_data[0]  = celloutsig_84z;
//   assign out_data[32] = 1'b0;
endmodule
