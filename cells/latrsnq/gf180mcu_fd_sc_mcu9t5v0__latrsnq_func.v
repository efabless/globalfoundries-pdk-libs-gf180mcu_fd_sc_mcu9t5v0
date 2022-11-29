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

`ifndef GF180MCU_FD_SC_MCU9T5V0__LATRSNQ_V
`define GF180MCU_FD_SC_MCU9T5V0__LATRSNQ_V

`include "../../models/udp_hn_iq_latch/gf180mcu_fd_sc_mcu9t5v0__udp_hn_iq_latch.v"

`ifdef USE_POWER_PINS
module gf180mcu_fd_sc_mcu9t5v0__latrsnq_func( E, RN, D, SETN, Q, VDD, VSS, notifier );
inout VDD, VSS;
`else // If not USE_POWER_PINS
module gf180mcu_fd_sc_mcu9t5v0__latrsnq_func( E, RN, D, SETN, Q, notifier );
`endif // If not USE_POWER_PINS
input D, E, RN, SETN, notifier;
output Q;

	not MGM_BG_0( MGM_P0, SETN );

	not MGM_BG_1( MGM_C0, RN );

	gf180mcu_fd_sc_mcu9t5v0__udp_hn_iq_latch( IQ2, MGM_C0, MGM_P0, E, D, notifier );

	buf MGM_BG_2( Q, IQ2 );

endmodule
`endif // GF180MCU_FD_SC_MCU9T5V0__LATRSNQ_V
