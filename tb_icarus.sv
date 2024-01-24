module testbench;

  bit [95:0]  in_data;
  bit [95:0] out_data;

  top dut(in_data, out_data);

  initial begin

    $dumpfile("trace_icarus.vcd");
    $dumpvars(0,dut);

    in_data[31:0]   = 32'h00020000;
    in_data[63:32]  = 32'h00000000;
    in_data[95:64]  = 32'h00000000;

    #1;

    $display("Output with Icarus: %d", out_data[0]);
  end
endmodule
