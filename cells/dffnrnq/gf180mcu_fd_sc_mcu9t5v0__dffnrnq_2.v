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

`ifndef GF180MCU_FD_SC_MCU9T5V0__DFFNRNQ_2_V
`define GF180MCU_FD_SC_MCU9T5V0__DFFNRNQ_2_V

`include "gf180mcu_fd_sc_mcu9t5v0__dffnrnq_func.v"

`ifdef USE_POWER_PINS
module gf180mcu_fd_sc_mcu9t5v0__dffnrnq_2( CLKN, D, RN, Q, VDD, VSS );
inout VDD, VSS;
`else // If not USE_POWER_PINS
module gf180mcu_fd_sc_mcu9t5v0__dffnrnq_2( CLKN, D, RN, Q );
`endif // If not USE_POWER_PINS
input CLKN, D, RN;
output Q;
reg notifier;

`ifdef USE_POWER_PINS
  gf180mcu_fd_sc_mcu9t5v0__dffnrnq_func gf180mcu_fd_sc_mcu9t5v0__dffnrnq_inst(.CLKN(CLKN),.D(D),.RN(RN),.Q(Q),.VDD(VDD),.VSS(VSS),.notifier(notifier));
`else // If not USE_POWER_PINS
  gf180mcu_fd_sc_mcu9t5v0__dffnrnq_func gf180mcu_fd_sc_mcu9t5v0__dffnrnq_inst(.CLKN(CLKN),.D(D),.RN(RN),.Q(Q),.notifier(notifier));
`endif // If not USE_POWER_PINS

`ifndef FUNCTIONAL
	// spec_gates_begin


	not MGM_G0(MGM_W0,D);


	and MGM_G1(ENABLE_NOT_D_AND_RN,RN,MGM_W0);


	and MGM_G2(ENABLE_D_AND_RN,RN,D);


	buf MGM_G3(ENABLE_RN,RN);


	not MGM_G4(MGM_W1,CLKN);


	not MGM_G5(MGM_W2,D);


	and MGM_G6(ENABLE_NOT_CLKN_AND_NOT_D,MGM_W2,MGM_W1);


	not MGM_G7(MGM_W3,CLKN);


	and MGM_G8(ENABLE_NOT_CLKN_AND_D,D,MGM_W3);


	not MGM_G9(MGM_W4,D);


	and MGM_G10(ENABLE_CLKN_AND_NOT_D,MGM_W4,CLKN);


	and MGM_G11(ENABLE_CLKN_AND_D,D,CLKN);


	// spec_gates_end



   specify

	// specify_block_begin

	// seq arc CLKN --> Q
	(negedge CLKN => (Q : D))  = (1.0,1.0);

	if(CLKN===1'b0 && D===1'b0)
	// seq arc RN --> Q
	(RN => Q)  = (1.0,1.0);

	if(CLKN===1'b0 && D===1'b1)
	// seq arc RN --> Q
	(RN => Q)  = (1.0,1.0);

	if(CLKN===1'b1 && D===1'b0)
	// seq arc RN --> Q
	(RN => Q)  = (1.0,1.0);

	if(CLKN===1'b1 && D===1'b1)
	// seq arc RN --> Q
	(RN => Q)  = (1.0,1.0);

	ifnone
	// seq arc RN --> Q
	(RN => Q)  = (1.0,1.0);

	$width(negedge CLKN &&& (ENABLE_NOT_D_AND_RN === 1'b1)
		,1.0,0,notifier);

	$width(posedge CLKN &&& (ENABLE_NOT_D_AND_RN === 1'b1)
		,1.0,0,notifier);

	$width(negedge CLKN &&& (ENABLE_D_AND_RN === 1'b1)
		,1.0,0,notifier);

	$width(posedge CLKN &&& (ENABLE_D_AND_RN === 1'b1)
		,1.0,0,notifier);

	// hold D-HL CLKN-HL
	$hold(negedge CLKN &&& (ENABLE_RN === 1'b1),
		negedge D &&& (ENABLE_RN === 1'b1),1.0,notifier);

	// hold D-LH CLKN-HL
	$hold(negedge CLKN &&& (ENABLE_RN === 1'b1),
		posedge D &&& (ENABLE_RN === 1'b1),1.0,notifier);

	// setup D-HL CLKN-HL
	$setup(negedge D &&& (ENABLE_RN === 1'b1),
		negedge CLKN &&& (ENABLE_RN === 1'b1),1.0,notifier);

	// setup D-LH CLKN-HL
	$setup(posedge D &&& (ENABLE_RN === 1'b1),
		negedge CLKN &&& (ENABLE_RN === 1'b1),1.0,notifier);

	// recovery RN-LH CLKN-HL
	$recovery(posedge RN,negedge CLKN,1.0,notifier);

	// removal RN-LH CLKN-HL
	$removal(posedge RN,negedge CLKN,1.0,notifier);

	$width(negedge RN &&& (ENABLE_NOT_CLKN_AND_NOT_D === 1'b1)
		,1.0,0,notifier);

	$width(negedge RN &&& (ENABLE_NOT_CLKN_AND_D === 1'b1)
		,1.0,0,notifier);

	$width(negedge RN &&& (ENABLE_CLKN_AND_NOT_D === 1'b1)
		,1.0,0,notifier);

	$width(negedge RN &&& (ENABLE_CLKN_AND_D === 1'b1)
		,1.0,0,notifier);

	// mpw CLKN_lh
	$width(posedge CLKN,1.0,0,notifier);

	// mpw CLKN_hl
	$width(negedge CLKN,1.0,0,notifier);

	// mpw RN_hl
	$width(negedge RN,1.0,0,notifier);

	// period CLKN
	$period(negedge CLKN &&& (ENABLE_NOT_D_AND_RN === 1'b1)
		,1.0,notifier);

	// period CLKN
	$period(negedge CLKN &&& (ENABLE_D_AND_RN === 1'b1)
		,1.0,notifier);

	// period CLKN
	$period(posedge CLKN,1.0,notifier);

	// specify_block_end

   endspecify

   `endif

endmodule
`endif // GF180MCU_FD_SC_MCU9T5V0__DFFNRNQ_2_V
