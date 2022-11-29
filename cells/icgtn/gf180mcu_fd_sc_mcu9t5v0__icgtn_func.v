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

`ifndef GF180MCU_FD_SC_MCU9T5V0__ICGTN_V
`define GF180MCU_FD_SC_MCU9T5V0__ICGTN_V

`include "../../models/udp_n_iq_latch/gf180mcu_fd_sc_mcu9t5v0__udp_n_iq_latch.v"

`ifdef USE_POWER_PINS
module gf180mcu_fd_sc_mcu9t5v0__icgtn_func( TE, E, CLKN, Q, VDD, VSS, notifier );
inout VDD, VSS;
`else // If not USE_POWER_PINS
module gf180mcu_fd_sc_mcu9t5v0__icgtn_func( TE, E, CLKN, Q, notifier );
`endif // If not USE_POWER_PINS
input CLKN, E, TE, notifier;
output Q;

	or MGM_BG_0( MGM_D0, E, TE );

	gf180mcu_fd_sc_mcu9t5v0__udp_n_iq_latch( IQ3, 1'b0, 1'b0, CLKN, MGM_D0, notifier );

	wire IQ3_inv_for_gf180mcu_fd_sc_mcu9t5v0__icgtn_4;

	not MGM_BG_1( IQ3_inv_for_gf180mcu_fd_sc_mcu9t5v0__icgtn_4, IQ3 );

	or MGM_BG_2( Q, CLKN, IQ3_inv_for_gf180mcu_fd_sc_mcu9t5v0__icgtn_4 );

endmodule
`endif // GF180MCU_FD_SC_MCU9T5V0__ICGTN_V
