

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

    Based on hardware measurements and Sauraen VHDL version of OPN/OPN2,
    which is based on die shots.

    Author: Jose Tejada Gomez. Twitter: @topapate
    Version: 1.0
    Date: 14-4-2017 

*/

module jt51_exprom
(
    input [7:0]         addr,
    input               clk,
    input               cen,
    output reg [12:0]   exp
);

    reg [12:0] explut[255:0];
    initial
    begin
        explut[000] = 13'h1fea;
        explut[001] = 13'h1fd4;
        explut[002] = 13'h1fbe;
        explut[003] = 13'h1fa8;
        explut[004] = 13'h1f92;
        explut[005] = 13'h1f7c;
        explut[006] = 13'h1f66;
        explut[007] = 13'h1f50;
        explut[008] = 13'h1f3b;
        explut[009] = 13'h1f25;
        explut[010] = 13'h1f10;
        explut[011] = 13'h1efa;
        explut[012] = 13'h1ee5;
        explut[013] = 13'h1ecf;
        explut[014] = 13'h1eba;
        explut[015] = 13'h1ea5;
        explut[016] = 13'h1e8f;
        explut[017] = 13'h1e7a;
        explut[018] = 13'h1e65;
        explut[019] = 13'h1e50;
        explut[020] = 13'h1e3b;
        explut[021] = 13'h1e26;
        explut[022] = 13'h1e11;
        explut[023] = 13'h1dfd;
        explut[024] = 13'h1de8;
        explut[025] = 13'h1dd3;
        explut[026] = 13'h1dbe;
        explut[027] = 13'h1daa;
        explut[028] = 13'h1d95;
        explut[029] = 13'h1d81;
        explut[030] = 13'h1d6c;
        explut[031] = 13'h1d58;
        explut[032] = 13'h1d44;
        explut[033] = 13'h1d30;
        explut[034] = 13'h1d1b;
        explut[035] = 13'h1d07;
        explut[036] = 13'h1cf3;
        explut[037] = 13'h1cdf;
        explut[038] = 13'h1ccb;
        explut[039] = 13'h1cb7;
        explut[040] = 13'h1ca3;
        explut[041] = 13'h1c8f;
        explut[042] = 13'h1c7c;
        explut[043] = 13'h1c68;
        explut[044] = 13'h1c54;
        explut[045] = 13'h1c41;
        explut[046] = 13'h1c2d;
        explut[047] = 13'h1c1a;
        explut[048] = 13'h1c06;
        explut[049] = 13'h1bf3;
        explut[050] = 13'h1bdf;
        explut[051] = 13'h1bcc;
        explut[052] = 13'h1bb9;
        explut[053] = 13'h1ba6;
        explut[054] = 13'h1b93;
        explut[055] = 13'h1b7f;
        explut[056] = 13'h1b6c;
        explut[057] = 13'h1b59;
        explut[058] = 13'h1b47;
        explut[059] = 13'h1b34;
        explut[060] = 13'h1b21;
        explut[061] = 13'h1b0e;
        explut[062] = 13'h1afb;
        explut[063] = 13'h1ae9;
        explut[064] = 13'h1ad6;
        explut[065] = 13'h1ac3;
        explut[066] = 13'h1ab1;
        explut[067] = 13'h1a9e;
        explut[068] = 13'h1a8c;
        explut[069] = 13'h1a7a;
        explut[070] = 13'h1a67;
        explut[071] = 13'h1a55;
        explut[072] = 13'h1a43;
        explut[073] = 13'h1a31;
        explut[074] = 13'h1a1e;
        explut[075] = 13'h1a0c;
        explut[076] = 13'h19fa;
        explut[077] = 13'h19e8;
        explut[078] = 13'h19d6;
        explut[079] = 13'h19c5;
        explut[080] = 13'h19b3;
        explut[081] = 13'h19a1;
        explut[082] = 13'h198f;
        explut[083] = 13'h197e;
        explut[084] = 13'h196c;
        explut[085] = 13'h195a;
        explut[086] = 13'h1949;
        explut[087] = 13'h1937;
        explut[088] = 13'h1926;
        explut[089] = 13'h1914;
        explut[090] = 13'h1903;
        explut[091] = 13'h18f2;
        explut[092] = 13'h18e0;
        explut[093] = 13'h18cf;
        explut[094] = 13'h18be;
        explut[095] = 13'h18ad;
        explut[096] = 13'h189c;
        explut[097] = 13'h188b;
        explut[098] = 13'h187a;
        explut[099] = 13'h1869;
        explut[100] = 13'h1858;
        explut[101] = 13'h1847;
        explut[102] = 13'h1836;
        explut[103] = 13'h1826;
        explut[104] = 13'h1815;
        explut[105] = 13'h1804;
        explut[106] = 13'h17f4;
        explut[107] = 13'h17e3;
        explut[108] = 13'h17d2;
        explut[109] = 13'h17c2;
        explut[110] = 13'h17b1;
        explut[111] = 13'h17a1;
        explut[112] = 13'h1791;
        explut[113] = 13'h1780;
        explut[114] = 13'h1770;
        explut[115] = 13'h1760;
        explut[116] = 13'h1750;
        explut[117] = 13'h1740;
        explut[118] = 13'h1730;
        explut[119] = 13'h171f;
        explut[120] = 13'h170f;
        explut[121] = 13'h16ff;
        explut[122] = 13'h16f0;
        explut[123] = 13'h16e0;
        explut[124] = 13'h16d0;
        explut[125] = 13'h16c0;
        explut[126] = 13'h16b0;
        explut[127] = 13'h16a1;
        explut[128] = 13'h1691;
        explut[129] = 13'h1681;
        explut[130] = 13'h1672;
        explut[131] = 13'h1662;
        explut[132] = 13'h1653;
        explut[133] = 13'h1643;
        explut[134] = 13'h1634;
        explut[135] = 13'h1624;
        explut[136] = 13'h1615;
        explut[137] = 13'h1606;
        explut[138] = 13'h15f7;
        explut[139] = 13'h15e7;
        explut[140] = 13'h15d8;
        explut[141] = 13'h15c9;
        explut[142] = 13'h15ba;
        explut[143] = 13'h15ab;
        explut[144] = 13'h159c;
        explut[145] = 13'h158d;
        explut[146] = 13'h157e;
        explut[147] = 13'h156f;
        explut[148] = 13'h1560;
        explut[149] = 13'h1552;
        explut[150] = 13'h1543;
        explut[151] = 13'h1534;
        explut[152] = 13'h1525;
        explut[153] = 13'h1517;
        explut[154] = 13'h1508;
        explut[155] = 13'h14fa;
        explut[156] = 13'h14eb;
        explut[157] = 13'h14dd;
        explut[158] = 13'h14ce;
        explut[159] = 13'h14c0;
        explut[160] = 13'h14b1;
        explut[161] = 13'h14a3;
        explut[162] = 13'h1495;
        explut[163] = 13'h1487;
        explut[164] = 13'h1478;
        explut[165] = 13'h146a;
        explut[166] = 13'h145c;
        explut[167] = 13'h144e;
        explut[168] = 13'h1440;
        explut[169] = 13'h1432;
        explut[170] = 13'h1424;
        explut[171] = 13'h1416;
        explut[172] = 13'h1408;
        explut[173] = 13'h13fa;
        explut[174] = 13'h13ec;
        explut[175] = 13'h13df;
        explut[176] = 13'h13d1;
        explut[177] = 13'h13c3;
        explut[178] = 13'h13b5;
        explut[179] = 13'h13a8;
        explut[180] = 13'h139a;
        explut[181] = 13'h138d;
        explut[182] = 13'h137f;
        explut[183] = 13'h1372;
        explut[184] = 13'h1364;
        explut[185] = 13'h1357;
        explut[186] = 13'h1349;
        explut[187] = 13'h133c;
        explut[188] = 13'h132f;
        explut[189] = 13'h1321;
        explut[190] = 13'h1314;
        explut[191] = 13'h1307;
        explut[192] = 13'h12fa;
        explut[193] = 13'h12ed;
        explut[194] = 13'h12e0;
        explut[195] = 13'h12d3;
        explut[196] = 13'h12c5;
        explut[197] = 13'h12b8;
        explut[198] = 13'h12ac;
        explut[199] = 13'h129f;
        explut[200] = 13'h1292;
        explut[201] = 13'h1285;
        explut[202] = 13'h1278;
        explut[203] = 13'h126b;
        explut[204] = 13'h125f;
        explut[205] = 13'h1252;
        explut[206] = 13'h1245;
        explut[207] = 13'h1238;
        explut[208] = 13'h122c;
        explut[209] = 13'h121f;
        explut[210] = 13'h1213;
        explut[211] = 13'h1206;
        explut[212] = 13'h11fa;
        explut[213] = 13'h11ed;
        explut[214] = 13'h11e1;
        explut[215] = 13'h11d5;
        explut[216] = 13'h11c8;
        explut[217] = 13'h11bc;
        explut[218] = 13'h11b0;
        explut[219] = 13'h11a3;
        explut[220] = 13'h1197;
        explut[221] = 13'h118b;
        explut[222] = 13'h117f;
        explut[223] = 13'h1173;
        explut[224] = 13'h1167;
        explut[225] = 13'h115b;
        explut[226] = 13'h114f;
        explut[227] = 13'h1143;
        explut[228] = 13'h1137;
        explut[229] = 13'h112b;
        explut[230] = 13'h111f;
        explut[231] = 13'h1113;
        explut[232] = 13'h1107;
        explut[233] = 13'h10fb;
        explut[234] = 13'h10f0;
        explut[235] = 13'h10e4;
        explut[236] = 13'h10d8;
        explut[237] = 13'h10cd;
        explut[238] = 13'h10c1;
        explut[239] = 13'h10b5;
        explut[240] = 13'h10aa;
        explut[241] = 13'h109e;
        explut[242] = 13'h1093;
        explut[243] = 13'h1087;
        explut[244] = 13'h107c;
        explut[245] = 13'h1070;
        explut[246] = 13'h1065;
        explut[247] = 13'h105a;
        explut[248] = 13'h104e;
        explut[249] = 13'h1043;
        explut[250] = 13'h1038;
        explut[251] = 13'h102d;
        explut[252] = 13'h1021;
        explut[253] = 13'h1016;
        explut[254] = 13'h100b;
        explut[255] = 13'h1000;
    end

    always @ (posedge clk) if(cen) begin
        exp <= explut[addr];
    end

endmodule
