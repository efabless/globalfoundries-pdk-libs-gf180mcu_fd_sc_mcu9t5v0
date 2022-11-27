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

`ifndef GF180MCU_FD_SC_MCU9T5V0__LATRNQ_V
`define GF180MCU_FD_SC_MCU9T5V0__LATRNQ_V

`include "../udp/udp_primitives.v"

`ifdef USE_POWER_PINS
module gf180mcu_fd_sc_mcu9t5v0__latrnq_func( E, RN, D, Q, VDD, VSS, notifier );
inout VDD, VSS;
`else // If not USE_POWER_PINS
module gf180mcu_fd_sc_mcu9t5v0__latrnq_func( E, RN, D, Q, notifier );
`endif // If not USE_POWER_PINS
input D, E, RN, notifier;
output Q;

	not MGM_BG_0( MGM_C0, RN );

	gf180mcu_fd_sc_mcu9t5v0__N_IQ_LATCH_udp( IQ2, MGM_C0, 1'b0, E, D, notifier );

	buf MGM_BG_1( Q, IQ2 );

endmodule
`endif // GF180MCU_FD_SC_MCU9T5V0__LATRNQ_V