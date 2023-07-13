// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_project_wrapper
 *
 * This wrapper enumerates all of the pins available to the
 * user for the user project.
 *
 * An example user project is provided in this wrapper.  The
 * example should be removed and replaced with the actual
 * user project.
 *
 *-------------------------------------------------------------
 */

module user_project_wrapper #(
    parameter BITS = 32
) (
`ifdef USE_POWER_PINS
    inout vdda1,	// User area 1 3.3V supply
    inout vdda2,	// User area 2 3.3V supply
    inout vssa1,	// User area 1 analog ground
    inout vssa2,	// User area 2 analog ground
    inout vccd1,	// User area 1 1.8V supply
    inout vccd2,	// User area 2 1.8v supply
    inout vssd1,	// User area 1 digital ground
    inout vssd2,	// User area 2 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // Analog (direct connection to GPIO pad---use with caution)
    // Note that analog I/O is not available on the 7 lowest-numbered
    // GPIO pads, and so the analog_io indexing is offset from the
    // GPIO indexing by 7 (also upper 2 GPIOs do not have analog_io).
    inout [`MPRJ_IO_PADS-10:0] analog_io,

    // Independent clock (on independent integer divider)
    input   user_clock2,

    // User maskable interrupt signals
    output [2:0] user_irq
    
);


/*--------------------------------------*/
/* User project is instantiated  here   */
/*--------------------------------------*/

efabless_subsystem efabless_subsystem(

    .i_clk(wb_clk_i),
    .i_rstn(wb_rst_i),

    // MGMT SoC Wishbone Slave

    .i_wbs_cyc_i(wbs_cyc_i),
    .i_wbs_stb(wbs_stb_i),
    .i_wbs_we_i(wbs_we_i),
    .i_wbs_sel(wbs_sel_i),
    .i_wbs_adr(wbs_adr_i),
    .i_wbs_dat(wbs_dat_i),
    .o_wbs_ack(wbs_ack_o),
    //.wbs_dat_o(wbs_dat_o),

    // Logic Analyzer

    .la_data_in(la_data_in),
    .la_data_out(la_data_out),
    .la_oenb (la_oenb),

    // IO Pads

   .io_in (io_in[2]),
    .io_out(io_out[1]),
    .io_oeb(io_oeb[0]),

    // IRQ
    .o_irq(user_irq)
);



//sky130_sram_1kbytes_1rw1r_197x48_8 mem197(
//`ifdef USE_POWER_PINS
//	.vccd1(vccd1),	// User area 1 1.8V power
//	.vssd1(vssd1),	// User area 1 digital ground
//`endif


//.clk0 (i_clk),
 //      .clk1 (i_clk), .csb0 (n_572), .din0 (memory_wdata), .wmask0
 //      (memory_wmask), .addr0 (memory_addr[5:0]), .web0 (n_573), .dout0
 //      (o_rdata), .csb1 (n_574), .addr1 (read_ptr_q[5:0]), .dout1
  //     (o_acc_rd_data));
    
//         .clk0 (i_clk), 
//  	  .clk1 (i_clk),
//	  .addr0 (i_address[15:10]),
//	  .addr1 (i_address[15:10]),
//	  .wmask0 (memory_wmask),
	  //.wmask0 (rmem_wmask11:0]),
//	  .csb0 (i_acc_rd_ready),
//	  .web0 (i_acc_wr_valid),
	  //.web0 (i_wdata),
//	  .csb1 (22'b0),
//	  .din0 (memory_wdata),
//	  .dout0 (o_rdata),
//	  .dout1 (o_acc_rd_data)
//);




//sky130_sram_0kbytes_1rw1r_22x32_8 mem22(
//`ifdef USE_POWER_PINS
//	.vccd1(vccd1),	// User area 1 1.8V power
//	.vssd1(vssd1),	// User area 1 digital ground
//`endif


    
 //    .clk0 (wb_clk_i), 
//	  .clk1 (wb_clk_i),
//	  .addr0 (wbs_adr_i[4:0]),
//	  .addr1 (wbs_adr_i[4:0]),
//	  .wmask0 (wbs_sel_i[2:0]),
//	  //.wmask0 (rmem_wmask[1:0]),
//	  .csb0 (wb_rst_i),
//	  .web0 (wbs_dat_i[0]),
	  //.web0 (i_wdata),
////	  .csb1 (22'b0),
//	    .din0 (la_data_in[21:0]),
//	  .dout0 (la_data_out[21:0]),
//	  .dout1 (la_data_out[21:0])
	  
//);
//


  //sky130_sram_0kbytes_1rw1r_24x32_8 mem241(
  //`ifdef USE_POWER_PINS
  //	.vccd1(vccd1),	// User area 1 1.8V power
  //	.vssd1(vssd1),	// User area 1 digital ground
  //`endif


    
  //      .clk0 (wb_clk_i), 
  //	  .clk1 (wb_clk_i),
  //	  .addr0 (wbs_adr_i[4:0]),
  //	  .addr1 (wbs_adr_i[4:0]),
  //	  .wmask0 (wbs_sel_i[2:0]),
  //	  //.wmask0 (rmem_wmask11:0]),
  //	  .csb0 (wb_rst_i),
  //	  .web0 (wbs_dat_i[1]),
	  //.web0 (i_wdata),
  //	  .csb1 (22'b0),
  //	  .din0 (la_data_in[23:0]),
  //	  .dout0 (la_data_out[23:0]),
  //	  .dout1 (la_data_out[23:0])
	  
  //);

  //sky130_sram_0kbytes_1rw1r_24x32_8 mem242(
  //`ifdef USE_POWER_PINS
  //	.vccd1(vccd1),	// User area 1 1.8V power
  //	.vssd1(vssd1),	// User area 1 digital ground
  //`endif


    
  //      .clk0 (wb_clk_i), 
  //	  .clk1 (wb_clk_i),
  //	  .addr0 (wbs_adr_i[9:5]),
  //	  .addr1 (wbs_adr_i[9:5]),
  //	  .wmask0 (wbs_sel_i[2:0]),
	  //.wmask0 (rmem_wmask11:0]),
  //	  .csb0 (wb_rst_i),
  //	  .web0 (wbs_dat_i[1]),
	  //.web0 (i_wdata),
  //	  .csb1 (22'b0),
  //	  .din0 (la_data_in[47:24]),
  //	  .dout0 (la_data_out[47:24]),
  //	  .dout1 (la_data_out[47:24])
	  //  
  //);

  //sky130_sram_1kbytes_1rw1r_200x48_8 mem200(
  //`ifdef USE_POWER_PINS
  //	.vccd1(vccd1),	// User area 1 1.8V power
  //	.vssd1(vssd1),	// User area 1 digital ground
  //`endif


//.clk0 (i_clk),
 //      .clk1 (i_clk), .csb0 (n_572), .din0 (memory_wdata), .wmask0
 //      (memory_wmask), .addr0 (memory_addr[5:0]), .web0 (n_573), .dout0
 //      (o_rdata), .csb1 (n_574), .addr1 (read_ptr_q[5:0]), .dout1
  //     (o_acc_rd_data));
    
   //         .clk0 (i_clk), 
       //    .clk1 (i_clk),
  //	  .addr0 (wbs_adr_i[15:10]),
  //	  .addr1 (wbs_adr_i[15:10]),
  //	  .wmask0 (la_oenb[24:0]),
	  //.wmask0 (rmem_wmask11:0]),
  //	  .csb0 (i_acc_rd_ready),
  //	  .web0 (i_acc_wr_valid),
	  //.web0 (i_wdata),
  //	  .csb1 (22'b0),
  //	  .din0 (la_data_in),
  //	  .dout0 (la_data_out),
  //	  .dout1 (la_data_out)
  //);


endmodule	// user_project_wrapper

`default_nettype wire
