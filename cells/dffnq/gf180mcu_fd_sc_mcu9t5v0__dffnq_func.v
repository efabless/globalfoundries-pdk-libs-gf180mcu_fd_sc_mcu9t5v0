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

`ifndef GF180MCU_FD_SC_MCU9T5V0__DFFNQ_V
`define GF180MCU_FD_SC_MCU9T5V0__DFFNQ_V

`ifdef USE_POWER_PINS
module gf180mcu_fd_sc_mcu9t5v0__dffnq_func( CLKN, D, Q, VDD, VSS, notifier );
inout VDD, VSS;
`else // If not USE_POWER_PINS
module gf180mcu_fd_sc_mcu9t5v0__dffnq_func( CLKN, D, Q, notifier );
`endif // If not USE_POWER_PINS
input CLKN, D, notifier;
output Q;

	not MGM_BG_0( MGM_CLK0, CLKN );

	not MGM_BG_1( MGM_D0, D );

	UDP_GF018hv5v_mcu_sc9_TT_1P8V_25C_verilog_nonpg_MGM_N_IQ_FF_UDP( IQ1, 1'b0, 1'b0, MGM_CLK0, MGM_D0, notifier );

	not MGM_BG_2( Q, IQ1 );

endmodule
`endif // GF180MCU_FD_SC_MCU9T5V0__DFFNQ_V
