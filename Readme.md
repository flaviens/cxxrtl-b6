# Bad assignment in CXXRTL under specific conditions

## How to reproduce

### Natively (may not show the bug)

```bash
bash run_cxxrtl.sh
```

### Using Docker

```bash
make build_docker
```

## Details

Yosys version: `Yosys 0.37+21 (git sha1 3d9e44d18, clang 10.0.0-4ubuntu1 -fPIC -Os)`
Icarus version (does not matter too much as long as not too old): `Icarus Verilog version 13.0 (devel) (s20221226-331-g77d7f0b8f)`

Expected:
```bash
Icarus
Output with Icarus: 0
CXXRTL
Output with CXXRTL 0
```

Actual:
```bash
Icarus
Output with Icarus: 0
CXXRTL
Output with CXXRTL 1
```

VCD traces are already provided in this repository.
The mistaken assignment seems to happen between out_0 and out_ in the CXXRTL wrapper.
Yet this is unstable in function of the contents of `top.sv`.

For example, replacing:
```
  assign { out_data[32], out_data[0] } = { 1'b0, celloutsig_84z };
```

with the equivalent
```
  assign out_data[0]  = celloutsig_84z;
  assign out_data[32] = 1'b0;
```

fixes the issue.

The issue seems dependent on GCC versions.
