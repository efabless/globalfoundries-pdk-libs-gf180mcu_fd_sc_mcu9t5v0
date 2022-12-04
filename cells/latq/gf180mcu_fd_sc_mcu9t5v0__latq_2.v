// Copyright 2022 GlobalFoundries PDK Authors
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

`ifndef GF180MCU_FD_SC_MCU9T5V0__LATQ_2_V
`define GF180MCU_FD_SC_MCU9T5V0__LATQ_2_V

`include "gf180mcu_fd_sc_mcu9t5v0__latq_func.v"

`ifdef USE_POWER_PINS
module gf180mcu_fd_sc_mcu9t5v0__latq_2( E, D, Q, VDD, VSS );
inout VDD, VSS;
`else // If not USE_POWER_PINS
module gf180mcu_fd_sc_mcu9t5v0__latq_2( E, D, Q );
`endif // If not USE_POWER_PINS
input D, E;
output Q;
reg notifier;

`ifdef USE_POWER_PINS
  gf180mcu_fd_sc_mcu9t5v0__latq_func gf180mcu_fd_sc_mcu9t5v0__latq_inst(.E(E),.D(D),.Q(Q),.VDD(VDD),.VSS(VSS),.notifier(notifier));
`else // If not USE_POWER_PINS
  gf180mcu_fd_sc_mcu9t5v0__latq_func gf180mcu_fd_sc_mcu9t5v0__latq_inst(.E(E),.D(D),.Q(Q),.notifier(notifier));
`endif // If not USE_POWER_PINS

`ifndef FUNCTIONAL
	// spec_gates_begin


	not MGM_G0(ENABLE_NOT_D,D);


	buf MGM_G1(ENABLE_D,D);


	// spec_gates_end



   specify

	// specify_block_begin

	// comb arc D --> Q
	 (D => Q) = (1.0,1.0);

	// seq arc E --> Q
	(posedge E => (Q : D))  = (1.0,1.0);

	// hold D-HL E-HL
	$hold(negedge E,negedge D,1.0,notifier);

	// hold D-LH E-HL
	$hold(negedge E,posedge D,1.0,notifier);

	// setup D-HL E-HL
	$setup(negedge D,negedge E,1.0,notifier);

	// setup D-LH E-HL
	$setup(posedge D,negedge E,1.0,notifier);

	$width(posedge E &&& (ENABLE_NOT_D === 1'b1)
		,1.0,0,notifier);

	$width(posedge E &&& (ENABLE_D === 1'b1)
		,1.0,0,notifier);

	// mpw E_lh
	$width(posedge E,1.0,0,notifier);

	// specify_block_end

   endspecify

   `endif

endmodule
`endif // GF180MCU_FD_SC_MCU9T5V0__LATQ_2_V
