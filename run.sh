# Prepare Icarus
rm -rf icarus_obj_dir && mkdir -p icarus_obj_dir && iverilog -g2012 -o icarus_obj_dir/Vtop top.sv tb_icarus.sv
# Prepare CXXRTL
mkdir -p cxxrtl_obj_dir && yosys -p 'read_verilog -sv wrapper_cxxrtl.sv top.sv; write_cxxrtl cxxrtl_obj_dir/cxxrtl.cpp' && c++ -g -O3 -std=c++14 -I`yosys-config --datdir`/include/backends/cxxrtl/runtime -Icxxrtl_obj_dir tb_cxxrtl_base.cpp -o cxxrtl_obj_dir/Vtop

# Run both testbenches
echo Icarus
vvp icarus_obj_dir/Vtop
echo CXXRTL
cxxrtl_obj_dir/Vtop
