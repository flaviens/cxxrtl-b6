#include "cxxrtl.cpp"
#include "cxxrtl/cxxrtl_vcd.h"

#include <fstream>

int main() {
  cxxrtl_design::p_wrapper__cxxrtl top;

  cxxrtl::vcd_writer vcd;
  cxxrtl::debug_items debug;
  top.debug_info(debug);
  vcd.timescale(1, "us");
  vcd.add(debug);

  vcd.sample(0);

  uint32_t out;
  top.p_in__0.set<uint32_t>(0x00020000);
  top.p_in__1.set<uint32_t>(0x00000000);
  top.p_in__2.set<uint32_t>(0x00000000);
  top.step();

  vcd.sample(1);

  std::ofstream outfile("trace_cxxrtl.vcd", std::ios::out);
  outfile << vcd.buffer;
  outfile.close();

  out = top.p_out__0.get<uint32_t>();
  std::cout << "Output with CXXRTL " << out << std::endl;

  return 0;
}
