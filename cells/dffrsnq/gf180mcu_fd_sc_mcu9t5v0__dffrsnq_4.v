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

`ifndef GF180MCU_FD_SC_MCU9T5V0__DFFRSNQ_4_V
`define GF180MCU_FD_SC_MCU9T5V0__DFFRSNQ_4_V

`include "gf180mcu_fd_sc_mcu9t5v0__dffrsnq_func.v"

`ifdef USE_POWER_PINS
module gf180mcu_fd_sc_mcu9t5v0__dffrsnq_4( CLK, D, SETN, RN, Q, VDD, VSS );
inout VDD, VSS;
`else // If not USE_POWER_PINS
module gf180mcu_fd_sc_mcu9t5v0__dffrsnq_4( CLK, D, SETN, RN, Q );
`endif // If not USE_POWER_PINS
input CLK, D, RN, SETN;
output Q;
reg notifier;

`ifdef USE_POWER_PINS
  gf180mcu_fd_sc_mcu9t5v0__dffrsnq_func gf180mcu_fd_sc_mcu9t5v0__dffrsnq_inst(.CLK(CLK),.D(D),.SETN(SETN),.RN(RN),.Q(Q),.VDD(VDD),.VSS(VSS),.notifier(notifier));
`else // If not USE_POWER_PINS
  gf180mcu_fd_sc_mcu9t5v0__dffrsnq_func gf180mcu_fd_sc_mcu9t5v0__dffrsnq_inst(.CLK(CLK),.D(D),.SETN(SETN),.RN(RN),.Q(Q),.notifier(notifier));
`endif // If not USE_POWER_PINS

`ifndef FUNCTIONAL
	// spec_gates_begin


	not MGM_G0(MGM_W0,D);


	and MGM_G1(MGM_W1,RN,MGM_W0);


	and MGM_G2(ENABLE_NOT_D_AND_RN_AND_SETN,SETN,MGM_W1);


	and MGM_G3(MGM_W2,RN,D);


	and MGM_G4(ENABLE_D_AND_RN_AND_SETN,SETN,MGM_W2);


	and MGM_G5(ENABLE_RN_AND_SETN,SETN,RN);


	buf MGM_G6(ENABLE_SETN,SETN);


	not MGM_G7(MGM_W3,CLK);


	not MGM_G8(MGM_W4,D);


	and MGM_G9(MGM_W5,MGM_W4,MGM_W3);


	and MGM_G10(ENABLE_NOT_CLK_AND_NOT_D_AND_SETN,SETN,MGM_W5);


	not MGM_G11(MGM_W6,CLK);


	and MGM_G12(MGM_W7,D,MGM_W6);


	and MGM_G13(ENABLE_NOT_CLK_AND_D_AND_SETN,SETN,MGM_W7);


	not MGM_G14(MGM_W8,D);


	and MGM_G15(MGM_W9,MGM_W8,CLK);


	and MGM_G16(ENABLE_CLK_AND_NOT_D_AND_SETN,SETN,MGM_W9);


	and MGM_G17(MGM_W10,D,CLK);


	and MGM_G18(ENABLE_CLK_AND_D_AND_SETN,SETN,MGM_W10);


	not MGM_G19(MGM_W11,CLK);


	not MGM_G20(MGM_W12,D);


	and MGM_G21(ENABLE_NOT_CLK_AND_NOT_D,MGM_W12,MGM_W11);


	not MGM_G22(MGM_W13,CLK);


	and MGM_G23(ENABLE_NOT_CLK_AND_D,D,MGM_W13);


	not MGM_G24(MGM_W14,D);


	and MGM_G25(ENABLE_CLK_AND_NOT_D,MGM_W14,CLK);


	and MGM_G26(ENABLE_CLK_AND_D,D,CLK);


	buf MGM_G27(ENABLE_RN,RN);


	not MGM_G28(MGM_W15,CLK);


	not MGM_G29(MGM_W16,D);


	and MGM_G30(MGM_W17,MGM_W16,MGM_W15);


	and MGM_G31(ENABLE_NOT_CLK_AND_NOT_D_AND_RN,RN,MGM_W17);


	not MGM_G32(MGM_W18,CLK);


	and MGM_G33(MGM_W19,D,MGM_W18);


	and MGM_G34(ENABLE_NOT_CLK_AND_D_AND_RN,RN,MGM_W19);


	not MGM_G35(MGM_W20,D);


	and MGM_G36(MGM_W21,MGM_W20,CLK);


	and MGM_G37(ENABLE_CLK_AND_NOT_D_AND_RN,RN,MGM_W21);


	and MGM_G38(MGM_W22,D,CLK);


	and MGM_G39(ENABLE_CLK_AND_D_AND_RN,RN,MGM_W22);


	// spec_gates_end



   specify

	// specify_block_begin

	// seq arc CLK --> Q
	(posedge CLK => (Q : D))  = (1.0,1.0);

	if(CLK===1'b0 && D===1'b0 && SETN===1'b0)
	// seq arc RN --> Q
	(RN => Q)  = (1.0,1.0);

	if(CLK===1'b0 && D===1'b0 && SETN===1'b1)
	// seq arc RN --> Q
	(RN => Q)  = (1.0,1.0);

	if(CLK===1'b0 && D===1'b1 && SETN===1'b0)
	// seq arc RN --> Q
	(RN => Q)  = (1.0,1.0);

	if(CLK===1'b0 && D===1'b1 && SETN===1'b1)
	// seq arc RN --> Q
	(RN => Q)  = (1.0,1.0);

	if(CLK===1'b1 && D===1'b0 && SETN===1'b0)
	// seq arc RN --> Q
	(RN => Q)  = (1.0,1.0);

	if(CLK===1'b1 && D===1'b0 && SETN===1'b1)
	// seq arc RN --> Q
	(RN => Q)  = (1.0,1.0);

	if(CLK===1'b1 && D===1'b1 && SETN===1'b0)
	// seq arc RN --> Q
	(RN => Q)  = (1.0,1.0);

	if(CLK===1'b1 && D===1'b1 && SETN===1'b1)
	// seq arc RN --> Q
	(RN => Q)  = (1.0,1.0);

	ifnone
	// seq arc RN --> Q
	(RN => Q)  = (1.0,1.0);

	if(CLK===1'b0 && D===1'b0)
	// seq arc SETN --> Q
	(SETN => Q)  = (1.0,1.0);

	if(CLK===1'b0 && D===1'b1)
	// seq arc SETN --> Q
	(SETN => Q)  = (1.0,1.0);

	if(CLK===1'b1 && D===1'b0)
	// seq arc SETN --> Q
	(SETN => Q)  = (1.0,1.0);

	if(CLK===1'b1 && D===1'b1)
	// seq arc SETN --> Q
	(SETN => Q)  = (1.0,1.0);

	ifnone
	// seq arc SETN --> Q
	(SETN => Q)  = (1.0,1.0);

	$width(negedge CLK &&& (ENABLE_NOT_D_AND_RN_AND_SETN === 1'b1)
		,1.0,0,notifier);

	$width(posedge CLK &&& (ENABLE_NOT_D_AND_RN_AND_SETN === 1'b1)
		,1.0,0,notifier);

	$width(negedge CLK &&& (ENABLE_D_AND_RN_AND_SETN === 1'b1)
		,1.0,0,notifier);

	$width(posedge CLK &&& (ENABLE_D_AND_RN_AND_SETN === 1'b1)
		,1.0,0,notifier);

	// hold D-HL CLK-LH
	$hold(posedge CLK &&& (ENABLE_RN_AND_SETN === 1'b1),
		negedge D &&& (ENABLE_RN_AND_SETN === 1'b1),1.0,notifier);

	// hold D-LH CLK-LH
	$hold(posedge CLK &&& (ENABLE_RN_AND_SETN === 1'b1),
		posedge D &&& (ENABLE_RN_AND_SETN === 1'b1),1.0,notifier);

	// setup D-HL CLK-LH
	$setup(negedge D &&& (ENABLE_RN_AND_SETN === 1'b1),
		posedge CLK &&& (ENABLE_RN_AND_SETN === 1'b1),1.0,notifier);

	// setup D-LH CLK-LH
	$setup(posedge D &&& (ENABLE_RN_AND_SETN === 1'b1),
		posedge CLK &&& (ENABLE_RN_AND_SETN === 1'b1),1.0,notifier);

	// recovery RN-LH CLK-LH
	$recovery(posedge RN &&& (ENABLE_SETN === 1'b1),
		posedge CLK &&& (ENABLE_SETN === 1'b1),1.0,notifier);

	// removal RN-LH CLK-LH
	$removal(posedge RN &&& (ENABLE_SETN === 1'b1),
		posedge CLK &&& (ENABLE_SETN === 1'b1),1.0,notifier);

	$width(negedge RN &&& (ENABLE_NOT_CLK_AND_NOT_D_AND_SETN === 1'b1)
		,1.0,0,notifier);

	$width(negedge RN &&& (ENABLE_NOT_CLK_AND_D_AND_SETN === 1'b1)
		,1.0,0,notifier);

	$width(negedge RN &&& (ENABLE_CLK_AND_NOT_D_AND_SETN === 1'b1)
		,1.0,0,notifier);

	$width(negedge RN &&& (ENABLE_CLK_AND_D_AND_SETN === 1'b1)
		,1.0,0,notifier);

	// hold RN-LH SETN-LH
	$hold(posedge SETN &&& (ENABLE_NOT_CLK_AND_NOT_D === 1'b1),
		posedge RN &&& (ENABLE_NOT_CLK_AND_NOT_D === 1'b1),1.0,notifier);

	// setup RN-LH SETN-LH
	$setup(posedge RN &&& (ENABLE_NOT_CLK_AND_NOT_D === 1'b1),
		posedge SETN &&& (ENABLE_NOT_CLK_AND_NOT_D === 1'b1),1.0,notifier);

	// hold RN-LH SETN-LH
	$hold(posedge SETN &&& (ENABLE_NOT_CLK_AND_D === 1'b1),
		posedge RN &&& (ENABLE_NOT_CLK_AND_D === 1'b1),1.0,notifier);

	// setup RN-LH SETN-LH
	$setup(posedge RN &&& (ENABLE_NOT_CLK_AND_D === 1'b1),
		posedge SETN &&& (ENABLE_NOT_CLK_AND_D === 1'b1),1.0,notifier);

	// hold RN-LH SETN-LH
	$hold(posedge SETN &&& (ENABLE_CLK_AND_NOT_D === 1'b1),
		posedge RN &&& (ENABLE_CLK_AND_NOT_D === 1'b1),1.0,notifier);

	// setup RN-LH SETN-LH
	$setup(posedge RN &&& (ENABLE_CLK_AND_NOT_D === 1'b1),
		posedge SETN &&& (ENABLE_CLK_AND_NOT_D === 1'b1),1.0,notifier);

	// hold RN-LH SETN-LH
	$hold(posedge SETN &&& (ENABLE_CLK_AND_D === 1'b1),
		posedge RN &&& (ENABLE_CLK_AND_D === 1'b1),1.0,notifier);

	// setup RN-LH SETN-LH
	$setup(posedge RN &&& (ENABLE_CLK_AND_D === 1'b1),
		posedge SETN &&& (ENABLE_CLK_AND_D === 1'b1),1.0,notifier);

	// recovery SETN-LH CLK-LH
	$recovery(posedge SETN &&& (ENABLE_RN === 1'b1),
		posedge CLK &&& (ENABLE_RN === 1'b1),1.0,notifier);

	// removal SETN-LH CLK-LH
	$removal(posedge SETN &&& (ENABLE_RN === 1'b1),
		posedge CLK &&& (ENABLE_RN === 1'b1),1.0,notifier);

	// hold SETN-LH RN-LH
	$hold(posedge RN &&& (ENABLE_NOT_CLK_AND_NOT_D === 1'b1),
		posedge SETN &&& (ENABLE_NOT_CLK_AND_NOT_D === 1'b1),1.0,notifier);

	// setup SETN-LH RN-LH
	$setup(posedge SETN &&& (ENABLE_NOT_CLK_AND_NOT_D === 1'b1),
		posedge RN &&& (ENABLE_NOT_CLK_AND_NOT_D === 1'b1),1.0,notifier);

	// hold SETN-LH RN-LH
	$hold(posedge RN &&& (ENABLE_NOT_CLK_AND_D === 1'b1),
		posedge SETN &&& (ENABLE_NOT_CLK_AND_D === 1'b1),1.0,notifier);

	// setup SETN-LH RN-LH
	$setup(posedge SETN &&& (ENABLE_NOT_CLK_AND_D === 1'b1),
		posedge RN &&& (ENABLE_NOT_CLK_AND_D === 1'b1),1.0,notifier);

	// hold SETN-LH RN-LH
	$hold(posedge RN &&& (ENABLE_CLK_AND_NOT_D === 1'b1),
		posedge SETN &&& (ENABLE_CLK_AND_NOT_D === 1'b1),1.0,notifier);

	// setup SETN-LH RN-LH
	$setup(posedge SETN &&& (ENABLE_CLK_AND_NOT_D === 1'b1),
		posedge RN &&& (ENABLE_CLK_AND_NOT_D === 1'b1),1.0,notifier);

	// hold SETN-LH RN-LH
	$hold(posedge RN &&& (ENABLE_CLK_AND_D === 1'b1),
		posedge SETN &&& (ENABLE_CLK_AND_D === 1'b1),1.0,notifier);

	// setup SETN-LH RN-LH
	$setup(posedge SETN &&& (ENABLE_CLK_AND_D === 1'b1),
		posedge RN &&& (ENABLE_CLK_AND_D === 1'b1),1.0,notifier);

	$width(negedge SETN &&& (ENABLE_NOT_CLK_AND_NOT_D_AND_RN === 1'b1)
		,1.0,0,notifier);

	$width(negedge SETN &&& (ENABLE_NOT_CLK_AND_D_AND_RN === 1'b1)
		,1.0,0,notifier);

	$width(negedge SETN &&& (ENABLE_CLK_AND_NOT_D_AND_RN === 1'b1)
		,1.0,0,notifier);

	$width(negedge SETN &&& (ENABLE_CLK_AND_D_AND_RN === 1'b1)
		,1.0,0,notifier);

	// mpw CLK_lh
	$width(posedge CLK,1.0,0,notifier);

	// mpw CLK_hl
	$width(negedge CLK,1.0,0,notifier);

	// mpw RN_hl
	$width(negedge RN,1.0,0,notifier);

	// mpw SETN_hl
	$width(negedge SETN,1.0,0,notifier);

	// period CLK
	$period(posedge CLK &&& (ENABLE_NOT_D_AND_RN_AND_SETN === 1'b1)
		,1.0,notifier);

	// period CLK
	$period(posedge CLK &&& (ENABLE_D_AND_RN_AND_SETN === 1'b1)
		,1.0,notifier);

	// period CLK
	$period(posedge CLK,1.0,notifier);

	// specify_block_end

   endspecify

   `endif

endmodule
`endif // GF180MCU_FD_SC_MCU9T5V0__DFFRSNQ_4_V
