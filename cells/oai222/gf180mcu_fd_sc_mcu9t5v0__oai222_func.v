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

`ifndef GF180MCU_FD_SC_MCU9T5V0__OAI222_V
`define GF180MCU_FD_SC_MCU9T5V0__OAI222_V

`include "../udp/udp_primitives.v"

`ifdef USE_POWER_PINS
module gf180mcu_fd_sc_mcu9t5v0__oai222_func( ZN, C1, C2, B1, B2, A1, A2, VDD, VSS );
inout VDD, VSS;
`else // If not USE_POWER_PINS
module gf180mcu_fd_sc_mcu9t5v0__oai222_func( ZN, C1, C2, B1, B2, A1, A2 );
`endif // If not USE_POWER_PINS
input A1, A2, B1, B2, C1, C2;
output ZN;

	wire A1_inv_for_gf180mcu_fd_sc_mcu9t5v0__oai222_2;

	not MGM_BG_0( A1_inv_for_gf180mcu_fd_sc_mcu9t5v0__oai222_2, A1 );

	wire A2_inv_for_gf180mcu_fd_sc_mcu9t5v0__oai222_2;

	not MGM_BG_1( A2_inv_for_gf180mcu_fd_sc_mcu9t5v0__oai222_2, A2 );

	wire ZN_row1;

	and MGM_BG_2( ZN_row1, A1_inv_for_gf180mcu_fd_sc_mcu9t5v0__oai222_2, A2_inv_for_gf180mcu_fd_sc_mcu9t5v0__oai222_2 );

	wire B1_inv_for_gf180mcu_fd_sc_mcu9t5v0__oai222_2;

	not MGM_BG_3( B1_inv_for_gf180mcu_fd_sc_mcu9t5v0__oai222_2, B1 );

	wire B2_inv_for_gf180mcu_fd_sc_mcu9t5v0__oai222_2;

	not MGM_BG_4( B2_inv_for_gf180mcu_fd_sc_mcu9t5v0__oai222_2, B2 );

	wire ZN_row2;

	and MGM_BG_5( ZN_row2, B1_inv_for_gf180mcu_fd_sc_mcu9t5v0__oai222_2, B2_inv_for_gf180mcu_fd_sc_mcu9t5v0__oai222_2 );

	wire C1_inv_for_gf180mcu_fd_sc_mcu9t5v0__oai222_2;

	not MGM_BG_6( C1_inv_for_gf180mcu_fd_sc_mcu9t5v0__oai222_2, C1 );

	wire C2_inv_for_gf180mcu_fd_sc_mcu9t5v0__oai222_2;

	not MGM_BG_7( C2_inv_for_gf180mcu_fd_sc_mcu9t5v0__oai222_2, C2 );

	wire ZN_row3;

	and MGM_BG_8( ZN_row3, C1_inv_for_gf180mcu_fd_sc_mcu9t5v0__oai222_2, C2_inv_for_gf180mcu_fd_sc_mcu9t5v0__oai222_2 );

	or MGM_BG_9( ZN, ZN_row1, ZN_row2, ZN_row3 );

endmodule
`endif // GF180MCU_FD_SC_MCU9T5V0__OAI222_V