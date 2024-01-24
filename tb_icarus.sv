module testbench;

  bit [31:0]  in_0;
  bit [31:0]  in_1;
  bit [31:0]  in_2;
  bit [31:0] out_0;

  top dut(in_0
,in_1
,in_2
,out_0
  );

  initial begin

    $dumpfile("trace_icarus.vcd");
    $dumpvars(0,dut);

    in_0[31:0] = 32'h00020000;
    in_1[31:0] = 32'h00000000;
    in_2[31:0] = 32'h00000000;

    #1;

    $display("Output with Icarus: %d", out_0[0]);
  end
endmodule
