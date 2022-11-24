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

`ifndef GF180MCU_FD_SC_MCU9T5V0__MUX2_1_V
`define GF180MCU_FD_SC_MCU9T5V0__MUX2_1_V

`include "gf180mcu_fd_sc_mcu9t5v0__mux2_func.v"

`ifdef USE_POWER_PINS
module gf180mcu_fd_sc_mcu9t5v0__mux2_1( Z, I1, S, I0, VDD, VSS );
inout VDD, VSS;
`else // If not USE_POWER_PINS
module gf180mcu_fd_sc_mcu9t5v0__mux2_1( Z, I1, S, I0 );
`endif // If not USE_POWER_PINS
input I0, I1, S;
output Z;

`ifdef USE_POWER_PINS
  gf180mcu_fd_sc_mcu9t5v0__mux2_func gf180mcu_fd_sc_mcu9t5v0__mux2_inst(.Z(Z),.I1(I1),.S(S),.I0(I0),.VDD(VDD),.VSS(VSS));
`else // If not USE_POWER_PINS
  gf180mcu_fd_sc_mcu9t5v0__mux2_func gf180mcu_fd_sc_mcu9t5v0__mux2_inst(.Z(Z),.I1(I1),.S(S),.I0(I0));
`endif // If not USE_POWER_PINS

`ifndef FUNCTIONAL
	// spec_gates_begin


	// spec_gates_end



   specify

	// specify_block_begin

	if(I1===1'b0)
	// comb arc I0 --> Z
	 (I0 => Z) = (1.0,1.0);

	if(I1===1'b1)
	// comb arc I0 --> Z
	 (I0 => Z) = (1.0,1.0);

	ifnone
	// comb arc I0 --> Z
	 (I0 => Z) = (1.0,1.0);

	if(I0===1'b0)
	// comb arc I1 --> Z
	 (I1 => Z) = (1.0,1.0);

	if(I0===1'b1)
	// comb arc I1 --> Z
	 (I1 => Z) = (1.0,1.0);

	ifnone
	// comb arc I1 --> Z
	 (I1 => Z) = (1.0,1.0);

	ifnone
	// comb arc posedge S --> (Z:S)
	 (posedge S => (Z:S)) = (1.0,1.0);

	ifnone
	// comb arc negedge S --> (Z:S)
	 (negedge S => (Z:S)) = (1.0,1.0);

	// specify_block_end

   endspecify

   `endif

endmodule
`endif // GF180MCU_FD_SC_MCU9T5V0__MUX2_1_V
