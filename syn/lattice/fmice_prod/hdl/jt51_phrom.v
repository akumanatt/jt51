

/* This file is part of JT51.

 
	JT51 program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	JT51 program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with JT51.  If not, see <http://www.gnu.org/licenses/>.

	Based on Sauraen VHDL version of OPN/OPN2, which is based on die shots.

	Author: Jose Tejada Gomez. Twitter: @topapate
	Version: 1.0
	Date: 14-4-2017	

*/

module jt51_phrom
(
	input [7:0] addr,
	input clk,
	input cen,
	output reg [11:0] ph
);

	reg [11:0] sinetable[255:0];
	initial
	begin
		sinetable[000] = 12'h859;
		sinetable[001] = 12'h6c3;
		sinetable[002] = 12'h607;
		sinetable[003] = 12'h58b;
		sinetable[004] = 12'h52e;
		sinetable[005] = 12'h4e4;
		sinetable[006] = 12'h4a6;
		sinetable[007] = 12'h471;
		sinetable[008] = 12'h443;
		sinetable[009] = 12'h41a;
		sinetable[010] = 12'h3f5;
		sinetable[011] = 12'h3d3;
		sinetable[012] = 12'h3b5;
		sinetable[013] = 12'h398;
		sinetable[014] = 12'h37e;
		sinetable[015] = 12'h365;
		sinetable[016] = 12'h34e;
		sinetable[017] = 12'h339;
		sinetable[018] = 12'h324;
		sinetable[019] = 12'h311;
		sinetable[020] = 12'h2ff;
		sinetable[021] = 12'h2ed;
		sinetable[022] = 12'h2dc;
		sinetable[023] = 12'h2cd;
		sinetable[024] = 12'h2bd;
		sinetable[025] = 12'h2af;
		sinetable[026] = 12'h2a0;
		sinetable[027] = 12'h293;
		sinetable[028] = 12'h286;
		sinetable[029] = 12'h279;
		sinetable[030] = 12'h26d;
		sinetable[031] = 12'h261;
		sinetable[032] = 12'h256;
		sinetable[033] = 12'h24b;
		sinetable[034] = 12'h240;
		sinetable[035] = 12'h236;
		sinetable[036] = 12'h22c;
		sinetable[037] = 12'h222;
		sinetable[038] = 12'h218;
		sinetable[039] = 12'h20f;
		sinetable[040] = 12'h206;
		sinetable[041] = 12'h1fd;
		sinetable[042] = 12'h1f5;
		sinetable[043] = 12'h1ec;
		sinetable[044] = 12'h1e4;
		sinetable[045] = 12'h1dc;
		sinetable[046] = 12'h1d4;
		sinetable[047] = 12'h1cd;
		sinetable[048] = 12'h1c5;
		sinetable[049] = 12'h1be;
		sinetable[050] = 12'h1b7;
		sinetable[051] = 12'h1b0;
		sinetable[052] = 12'h1a9;
		sinetable[053] = 12'h1a2;
		sinetable[054] = 12'h19b;
		sinetable[055] = 12'h195;
		sinetable[056] = 12'h18f;
		sinetable[057] = 12'h188;
		sinetable[058] = 12'h182;
		sinetable[059] = 12'h17c;
		sinetable[060] = 12'h177;
		sinetable[061] = 12'h171;
		sinetable[062] = 12'h16b;
		sinetable[063] = 12'h166;
		sinetable[064] = 12'h160;
		sinetable[065] = 12'h15b;
		sinetable[066] = 12'h155;
		sinetable[067] = 12'h150;
		sinetable[068] = 12'h14b;
		sinetable[069] = 12'h146;
		sinetable[070] = 12'h141;
		sinetable[071] = 12'h13c;
		sinetable[072] = 12'h137;
		sinetable[073] = 12'h133;
		sinetable[074] = 12'h12e;
		sinetable[075] = 12'h129;
		sinetable[076] = 12'h125;
		sinetable[077] = 12'h121;
		sinetable[078] = 12'h11c;
		sinetable[079] = 12'h118;
		sinetable[080] = 12'h114;
		sinetable[081] = 12'h10f;
		sinetable[082] = 12'h10b;
		sinetable[083] = 12'h107;
		sinetable[084] = 12'h103;
		sinetable[085] = 12'h0ff;
		sinetable[086] = 12'h0fb;
		sinetable[087] = 12'h0f8;
		sinetable[088] = 12'h0f4;
		sinetable[089] = 12'h0f0;
		sinetable[090] = 12'h0ec;
		sinetable[091] = 12'h0e9;
		sinetable[092] = 12'h0e5;
		sinetable[093] = 12'h0e2;
		sinetable[094] = 12'h0de;
		sinetable[095] = 12'h0db;
		sinetable[096] = 12'h0d7;
		sinetable[097] = 12'h0d4;
		sinetable[098] = 12'h0d1;
		sinetable[099] = 12'h0cd;
		sinetable[100] = 12'h0ca;
		sinetable[101] = 12'h0c7;
		sinetable[102] = 12'h0c4;
		sinetable[103] = 12'h0c1;
		sinetable[104] = 12'h0be;
		sinetable[105] = 12'h0bb;
		sinetable[106] = 12'h0b8;
		sinetable[107] = 12'h0b5;
		sinetable[108] = 12'h0b2;
		sinetable[109] = 12'h0af;
		sinetable[110] = 12'h0ac;
		sinetable[111] = 12'h0a9;
		sinetable[112] = 12'h0a7;
		sinetable[113] = 12'h0a4;
		sinetable[114] = 12'h0a1;
		sinetable[115] = 12'h09f;
		sinetable[116] = 12'h09c;
		sinetable[117] = 12'h099;
		sinetable[118] = 12'h097;
		sinetable[119] = 12'h094;
		sinetable[120] = 12'h092;
		sinetable[121] = 12'h08f;
		sinetable[122] = 12'h08d;
		sinetable[123] = 12'h08a;
		sinetable[124] = 12'h088;
		sinetable[125] = 12'h086;
		sinetable[126] = 12'h083;
		sinetable[127] = 12'h081;
		sinetable[128] = 12'h07f;
		sinetable[129] = 12'h07d;
		sinetable[130] = 12'h07a;
		sinetable[131] = 12'h078;
		sinetable[132] = 12'h076;
		sinetable[133] = 12'h074;
		sinetable[134] = 12'h072;
		sinetable[135] = 12'h070;
		sinetable[136] = 12'h06e;
		sinetable[137] = 12'h06c;
		sinetable[138] = 12'h06a;
		sinetable[139] = 12'h068;
		sinetable[140] = 12'h066;
		sinetable[141] = 12'h064;
		sinetable[142] = 12'h062;
		sinetable[143] = 12'h060;
		sinetable[144] = 12'h05e;
		sinetable[145] = 12'h05c;
		sinetable[146] = 12'h05b;
		sinetable[147] = 12'h059;
		sinetable[148] = 12'h057;
		sinetable[149] = 12'h055;
		sinetable[150] = 12'h053;
		sinetable[151] = 12'h052;
		sinetable[152] = 12'h050;
		sinetable[153] = 12'h04e;
		sinetable[154] = 12'h04d;
		sinetable[155] = 12'h04b;
		sinetable[156] = 12'h04a;
		sinetable[157] = 12'h048;
		sinetable[158] = 12'h046;
		sinetable[159] = 12'h045;
		sinetable[160] = 12'h043;
		sinetable[161] = 12'h042;
		sinetable[162] = 12'h040;
		sinetable[163] = 12'h03f;
		sinetable[164] = 12'h03e;
		sinetable[165] = 12'h03c;
		sinetable[166] = 12'h03b;
		sinetable[167] = 12'h039;
		sinetable[168] = 12'h038;
		sinetable[169] = 12'h037;
		sinetable[170] = 12'h035;
		sinetable[171] = 12'h034;
		sinetable[172] = 12'h033;
		sinetable[173] = 12'h031;
		sinetable[174] = 12'h030;
		sinetable[175] = 12'h02f;
		sinetable[176] = 12'h02e;
		sinetable[177] = 12'h02d;
		sinetable[178] = 12'h02b;
		sinetable[179] = 12'h02a;
		sinetable[180] = 12'h029;
		sinetable[181] = 12'h028;
		sinetable[182] = 12'h027;
		sinetable[183] = 12'h026;
		sinetable[184] = 12'h025;
		sinetable[185] = 12'h024;
		sinetable[186] = 12'h023;
		sinetable[187] = 12'h022;
		sinetable[188] = 12'h021;
		sinetable[189] = 12'h020;
		sinetable[190] = 12'h01f;
		sinetable[191] = 12'h01e;
		sinetable[192] = 12'h01d;
		sinetable[193] = 12'h01c;
		sinetable[194] = 12'h01b;
		sinetable[195] = 12'h01a;
		sinetable[196] = 12'h019;
		sinetable[197] = 12'h018;
		sinetable[198] = 12'h017;
		sinetable[199] = 12'h017;
		sinetable[200] = 12'h016;
		sinetable[201] = 12'h015;
		sinetable[202] = 12'h014;
		sinetable[203] = 12'h014;
		sinetable[204] = 12'h013;
		sinetable[205] = 12'h012;
		sinetable[206] = 12'h011;
		sinetable[207] = 12'h011;
		sinetable[208] = 12'h010;
		sinetable[209] = 12'h00f;
		sinetable[210] = 12'h00f;
		sinetable[211] = 12'h00e;
		sinetable[212] = 12'h00d;
		sinetable[213] = 12'h00d;
		sinetable[214] = 12'h00c;
		sinetable[215] = 12'h00c;
		sinetable[216] = 12'h00b;
		sinetable[217] = 12'h00a;
		sinetable[218] = 12'h00a;
		sinetable[219] = 12'h009;
		sinetable[220] = 12'h009;
		sinetable[221] = 12'h008;
		sinetable[222] = 12'h008;
		sinetable[223] = 12'h007;
		sinetable[224] = 12'h007;
		sinetable[225] = 12'h007;
		sinetable[226] = 12'h006;
		sinetable[227] = 12'h006;
		sinetable[228] = 12'h005;
		sinetable[229] = 12'h005;
		sinetable[230] = 12'h005;
		sinetable[231] = 12'h004;
		sinetable[232] = 12'h004;
		sinetable[233] = 12'h004;
		sinetable[234] = 12'h003;
		sinetable[235] = 12'h003;
		sinetable[236] = 12'h003;
		sinetable[237] = 12'h002;
		sinetable[238] = 12'h002;
		sinetable[239] = 12'h002;
		sinetable[240] = 12'h002;
		sinetable[241] = 12'h001;
		sinetable[242] = 12'h001;
		sinetable[243] = 12'h001;
		sinetable[244] = 12'h001;
		sinetable[245] = 12'h001;
		sinetable[246] = 12'h001;
		sinetable[247] = 12'h001;
		sinetable[248] = 12'h000;
		sinetable[249] = 12'h000;
		sinetable[250] = 12'h000;
		sinetable[251] = 12'h000;
		sinetable[252] = 12'h000;
		sinetable[253] = 12'h000;
		sinetable[254] = 12'h000;
		sinetable[255] = 12'h000;
	end

	always @ (posedge clk) if(cen)
		ph <= sinetable[addr];

endmodule
