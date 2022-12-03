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

`ifndef GF180MCU_FD_SC_MCU9T5V0__NOR4_FUNC_V
`define GF180MCU_FD_SC_MCU9T5V0__NOR4_FUNC_V

`ifdef USE_POWER_PINS
module gf180mcu_fd_sc_mcu9t5v0__nor4_func( A4, ZN, A3, A2, A1, VDD, VSS );
inout VDD, VSS;
`else // If not USE_POWER_PINS
module gf180mcu_fd_sc_mcu9t5v0__nor4_func( A4, ZN, A3, A2, A1 );
`endif // If not USE_POWER_PINS
input A1, A2, A3, A4;
output ZN;

	wire A1_inv_for_gf180mcu_fd_sc_mcu9t5v0__nor4_1;

	not MGM_BG_0( A1_inv_for_gf180mcu_fd_sc_mcu9t5v0__nor4_1, A1 );

	wire A2_inv_for_gf180mcu_fd_sc_mcu9t5v0__nor4_1;

	not MGM_BG_1( A2_inv_for_gf180mcu_fd_sc_mcu9t5v0__nor4_1, A2 );

	wire A3_inv_for_gf180mcu_fd_sc_mcu9t5v0__nor4_1;

	not MGM_BG_2( A3_inv_for_gf180mcu_fd_sc_mcu9t5v0__nor4_1, A3 );

	wire A4_inv_for_gf180mcu_fd_sc_mcu9t5v0__nor4_1;

	not MGM_BG_3( A4_inv_for_gf180mcu_fd_sc_mcu9t5v0__nor4_1, A4 );

	and MGM_BG_4( ZN, A1_inv_for_gf180mcu_fd_sc_mcu9t5v0__nor4_1, A2_inv_for_gf180mcu_fd_sc_mcu9t5v0__nor4_1, A3_inv_for_gf180mcu_fd_sc_mcu9t5v0__nor4_1, A4_inv_for_gf180mcu_fd_sc_mcu9t5v0__nor4_1 );

endmodule
`endif // GF180MCU_FD_SC_MCU9T5V0__NOR4_FUNC_V
