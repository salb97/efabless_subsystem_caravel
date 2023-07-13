# SPDX-FileCopyrightText: 2020 Efabless Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# SPDX-License-Identifier: Apache-2.0

set ::env(PDK) "sky130A"
set ::env(STD_CELL_LIBRARY) "sky130_fd_sc_hd"

set script_dir $::env(DESIGN_DIR)

# This makes sure that the core rings are outside the boundaries
# of your block.
set ::env(MAGIC_ZEROIZE_ORIGIN) 0

# Area Configurations. DON'T TOUCH.
set ::env(FP_SIZING) absolute
set ::env(DIE_AREA) "0 0 2920 3520"
set ::env(RUN_CVC) 0

# Pin Configurations. DON'T TOUCH
set ::env(FP_PIN_ORDER_CFG) $script_dir/pin_order.cfg

set ::unit 2.4
set ::env(FP_IO_VEXTEND) [expr 2*$::unit]
set ::env(FP_IO_HEXTEND) [expr 2*$::unit]
set ::env(FP_IO_VLENGTH) $::unit
set ::env(FP_IO_HLENGTH) $::unit

set ::env(FP_IO_VTHICKNESS_MULT) 4
set ::env(FP_IO_HTHICKNESS_MULT) 4

# Power & Pin Configurations. DON'T TOUCH.
set ::env(FP_PDN_CORE_RING) 1
set ::env(FP_PDN_CORE_RING_VWIDTH) 3.1
set ::env(FP_PDN_CORE_RING_HWIDTH) 3.1
set ::env(FP_PDN_CORE_RING_VOFFSET) 14
set ::env(FP_PDN_CORE_RING_HOFFSET) $::env(FP_PDN_CORE_RING_VOFFSET)
set ::env(FP_PDN_CORE_RING_VSPACING) 1.7
set ::env(FP_PDN_CORE_RING_HSPACING) $::env(FP_PDN_CORE_RING_VSPACING)

set ::env(FP_PDN_VWIDTH) 3.1
set ::env(FP_PDN_HWIDTH) 3.1
set ::env(FP_PDN_VSPACING) [expr 5*$::env(FP_PDN_CORE_RING_VWIDTH)]
set ::env(FP_PDN_HSPACING) [expr 5*$::env(FP_PDN_CORE_RING_HWIDTH)]

set ::env(VDD_NETS) [list {vccd1} {vccd2} {vdda1} {vdda2}]
set ::env(GND_NETS) [list {vssd1} {vssd2} {vssa1} {vssa2}]
set ::env(SYNTH_USE_PG_PINS_DEFINES) "USE_POWER_PINS"

# PDN Pitch
set ::env(FP_PDN_VPITCH) 180
set ::env(FP_PDN_HPITCH) $::env(FP_PDN_VPITCH)

# PDN Offset
set ::env(FP_PDN_VOFFSET) 5
set ::env(FP_PDN_HOFFSET) $::env(FP_PDN_VOFFSET)

set ::env(DESIGN_NAME) user_project_wrapper
#section end

# User Configurations

## Source Verilog Files
set ::env(VERILOG_FILES) "\
    $script_dir/src/defines.v \
    $script_dir/src/efabless_subsystem_netlist_elab.v \
    $script_dir/src/user_project_wrapper.v"
    
   
## Clock configurations
set ::env(CLOCK_PORT) "wb_clk_i"
set ::env(CLOCK_NET) "efabless_subsystem.i_clk"

set ::env(CLOCK_PERIOD) "20"

## Internal Macros
### Macro PDN Connections
#set ::env(FP_PDN_MACRO_HOOKS) "\
#      efabless_subsystem.input_memory_i.mem200 vccd1 vssd1 vccd1 vssd1\
 #      efabless_subsystem.output_memory_i.mem242 vccd1 vssd1 vccd1 vssd1\
#       efabless_subsystem.reduction_memory_i.mem241 vccd1 vssd1 vccd1 vssd1"


### Macro Placement
#set ::env(MACRO_PLACEMENT_CFG) $script_dir/macro.cfg

### Black-box verilog and views
set ::env(VERILOG_FILES_BLACKBOX) "\
    $script_dir/src/defines.v \
    $script_dir/src/sky130_sram_0kbytes_1rw1r_24x32_8.v\
    $script_dir/src/sky130_sram_1kbytes_1rw1r_200x48_8.v"

set ::env(EXTRA_LEFS) "\
    $script_dir/macros/sky130_sram_0kbytes_1rw1r_24x32_8.lef\
    $script_dir/macros/sky130_sram_1kbytes_1rw1r_200x48_8.lef"

set ::env(EXTRA_GDS_FILES) "\
    $script_dir/macros/sky130_sram_0kbytes_1rw1r_24x32_8.gds\
    $script_dir/macros/sky130_sram_1kbytes_1rw1r_200x48_8.gds"
    
set ::env(RT_MAX_LAYER) {met4}

# disable pdn check nodes becuase it hangs with multiple power domains.
# any issue with pdn connections will be flagged with LVS so it is not a critical check.
set ::env(FP_PDN_CHECK_NODES) 0

# The following is because there are no std cells in the example wrapper project.
set ::env(SYNTH_ELABORATE_ONLY) 0
set ::env(PL_RANDOM_GLB_PLACEMENT) 1

#set ::env(GPL_CELL_PADDING) 5
#set ::env(DPL_CELL_PADDING) 4
set ::env(FP_CORE_UTIL) 60
set ::env(PL_TARGET_DENSITY) .6

set ::env(SYNTH_NO_FLAT) 1

set ::env(PL_MACRO_HALO) "100 100"

set ::env(QUIT_ON_UNMAPPED_CELLS) 0

set ::env(PL_RESIZER_DESIGN_OPTIMIZATIONS) 0
set ::env(PL_RESIZER_TIMING_OPTIMIZATIONS) 0
set ::env(PL_RESIZER_BUFFER_INPUT_PORTS) 0
set ::env(PL_RESIZER_BUFFER_OUTPUT_PORTS) 0

set ::env(GLB_RESIZER_DESIGN_OPTIMIZATIONS) 0

set ::env(FP_PDN_ENABLE_RAILS) 0

#set ::env(DIODE_INSERTION_STRATEGY) 0
set ::env(GRT_REPAIR_ANTENNAS) 0
set ::env(DIODE_ON_PORTS) "none"
set ::env(RUN_HEURISTIC_DIODE_INSERTION) 0
set ::env(RUN_FILL_INSERTION) 0
set ::env(RUN_TAP_DECAP_INSERTION) 0
set ::env(RUN_CTS) 0

set ::env(QUIT_ON_LINTER_ERRORS) 0
set ::env(QUIT_ON_SYNTH_CHECKS) 0


# magic extraction issues
set ::env(MAGIC_DEF_LABELS) 0
