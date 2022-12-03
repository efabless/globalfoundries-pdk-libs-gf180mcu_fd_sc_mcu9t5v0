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

`ifndef GF180MCU_FD_SC_MCU9T5V0__CLKBUF_FUNC_V
`define GF180MCU_FD_SC_MCU9T5V0__CLKBUF_FUNC_V

`ifdef USE_POWER_PINS
module gf180mcu_fd_sc_mcu9t5v0__clkbuf_func( I, Z, VDD, VSS );
inout VDD, VSS;
`else // If not USE_POWER_PINS
module gf180mcu_fd_sc_mcu9t5v0__clkbuf_func( I, Z );
`endif // If not USE_POWER_PINS
input I;
output Z;

	buf MGM_BG_0( Z, I );

endmodule
`endif // GF180MCU_FD_SC_MCU9T5V0__CLKBUF_FUNC_V
