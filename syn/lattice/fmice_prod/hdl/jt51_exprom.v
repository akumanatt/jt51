

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
    output reg [15:0]   exp
);

    reg [15:0] explut[255:0];
    initial
    begin
        explut[000] = 16'hfe9e;
        explut[001] = 16'hfd3c;
        explut[002] = 16'hfbdc;
        explut[003] = 16'hfa7c;
        explut[004] = 16'hf91e;
        explut[005] = 16'hf7c0;
        explut[006] = 16'hf663;
        explut[007] = 16'hf507;
        explut[008] = 16'hf3ad;
        explut[009] = 16'hf253;
        explut[010] = 16'hf0fa;
        explut[011] = 16'hefa2;
        explut[012] = 16'hee4b;
        explut[013] = 16'hecf5;
        explut[014] = 16'heb9f;
        explut[015] = 16'hea4b;
        explut[016] = 16'he8f8;
        explut[017] = 16'he7a5;
        explut[018] = 16'he654;
        explut[019] = 16'he503;
        explut[020] = 16'he3b3;
        explut[021] = 16'he264;
        explut[022] = 16'he116;
        explut[023] = 16'hdfc9;
        explut[024] = 16'hde7d;
        explut[025] = 16'hdd32;
        explut[026] = 16'hdbe8;
        explut[027] = 16'hda9e;
        explut[028] = 16'hd956;
        explut[029] = 16'hd80e;
        explut[030] = 16'hd6c7;
        explut[031] = 16'hd582;
        explut[032] = 16'hd43d;
        explut[033] = 16'hd2f8;
        explut[034] = 16'hd1b5;
        explut[035] = 16'hd073;
        explut[036] = 16'hcf31;
        explut[037] = 16'hcdf1;
        explut[038] = 16'hccb1;
        explut[039] = 16'hcb72;
        explut[040] = 16'hca34;
        explut[041] = 16'hc8f7;
        explut[042] = 16'hc7bb;
        explut[043] = 16'hc67f;
        explut[044] = 16'hc544;
        explut[045] = 16'hc40b;
        explut[046] = 16'hc2d2;
        explut[047] = 16'hc19a;
        explut[048] = 16'hc063;
        explut[049] = 16'hbf2c;
        explut[050] = 16'hbdf7;
        explut[051] = 16'hbcc2;
        explut[052] = 16'hbb8e;
        explut[053] = 16'hba5b;
        explut[054] = 16'hb929;
        explut[055] = 16'hb7f7;
        explut[056] = 16'hb6c7;
        explut[057] = 16'hb597;
        explut[058] = 16'hb468;
        explut[059] = 16'hb33a;
        explut[060] = 16'hb20d;
        explut[061] = 16'hb0e0;
        explut[062] = 16'hafb5;
        explut[063] = 16'hae8a;
        explut[064] = 16'had60;
        explut[065] = 16'hac37;
        explut[066] = 16'hab0e;
        explut[067] = 16'ha9e7;
        explut[068] = 16'ha8c0;
        explut[069] = 16'ha79a;
        explut[070] = 16'ha675;
        explut[071] = 16'ha550;
        explut[072] = 16'ha42d;
        explut[073] = 16'ha30a;
        explut[074] = 16'ha1e8;
        explut[075] = 16'ha0c6;
        explut[076] = 16'h9fa6;
        explut[077] = 16'h9e86;
        explut[078] = 16'h9d67;
        explut[079] = 16'h9c49;
        explut[080] = 16'h9b2c;
        explut[081] = 16'h9a0f;
        explut[082] = 16'h98f3;
        explut[083] = 16'h97d8;
        explut[084] = 16'h96be;
        explut[085] = 16'h95a4;
        explut[086] = 16'h948c;
        explut[087] = 16'h9373;
        explut[088] = 16'h925c;
        explut[089] = 16'h9146;
        explut[090] = 16'h9030;
        explut[091] = 16'h8f1b;
        explut[092] = 16'h8e07;
        explut[093] = 16'h8cf3;
        explut[094] = 16'h8be0;
        explut[095] = 16'h8ace;
        explut[096] = 16'h89bd;
        explut[097] = 16'h88ac;
        explut[098] = 16'h879d;
        explut[099] = 16'h868e;
        explut[100] = 16'h857f;
        explut[101] = 16'h8472;
        explut[102] = 16'h8365;
        explut[103] = 16'h8259;
        explut[104] = 16'h814d;
        explut[105] = 16'h8042;
        explut[106] = 16'h7f38;
        explut[107] = 16'h7e2f;
        explut[108] = 16'h7d27;
        explut[109] = 16'h7c1f;
        explut[110] = 16'h7b18;
        explut[111] = 16'h7a11;
        explut[112] = 16'h790c;
        explut[113] = 16'h7807;
        explut[114] = 16'h7702;
        explut[115] = 16'h75ff;
        explut[116] = 16'h74fc;
        explut[117] = 16'h73fa;
        explut[118] = 16'h72f8;
        explut[119] = 16'h71f7;
        explut[120] = 16'h70f7;
        explut[121] = 16'h6ff8;
        explut[122] = 16'h6ef9;
        explut[123] = 16'h6dfb;
        explut[124] = 16'h6cfe;
        explut[125] = 16'h6c01;
        explut[126] = 16'h6b05;
        explut[127] = 16'h6a0a;
        explut[128] = 16'h690f;
        explut[129] = 16'h6815;
        explut[130] = 16'h671c;
        explut[131] = 16'h6624;
        explut[132] = 16'h652c;
        explut[133] = 16'h6434;
        explut[134] = 16'h633e;
        explut[135] = 16'h6248;
        explut[136] = 16'h6153;
        explut[137] = 16'h605e;
        explut[138] = 16'h5f6a;
        explut[139] = 16'h5e77;
        explut[140] = 16'h5d84;
        explut[141] = 16'h5c92;
        explut[142] = 16'h5ba1;
        explut[143] = 16'h5ab0;
        explut[144] = 16'h59c1;
        explut[145] = 16'h58d1;
        explut[146] = 16'h57e2;
        explut[147] = 16'h56f4;
        explut[148] = 16'h5607;
        explut[149] = 16'h551a;
        explut[150] = 16'h542e;
        explut[151] = 16'h5343;
        explut[152] = 16'h5258;
        explut[153] = 16'h516e;
        explut[154] = 16'h5084;
        explut[155] = 16'h4f9b;
        explut[156] = 16'h4eb3;
        explut[157] = 16'h4dcb;
        explut[158] = 16'h4ce4;
        explut[159] = 16'h4bfe;
        explut[160] = 16'h4b18;
        explut[161] = 16'h4a33;
        explut[162] = 16'h494e;
        explut[163] = 16'h486a;
        explut[164] = 16'h4787;
        explut[165] = 16'h46a4;
        explut[166] = 16'h45c2;
        explut[167] = 16'h44e1;
        explut[168] = 16'h4400;
        explut[169] = 16'h431f;
        explut[170] = 16'h4240;
        explut[171] = 16'h4161;
        explut[172] = 16'h4082;
        explut[173] = 16'h3fa4;
        explut[174] = 16'h3ec7;
        explut[175] = 16'h3dea;
        explut[176] = 16'h3d0e;
        explut[177] = 16'h3c33;
        explut[178] = 16'h3b58;
        explut[179] = 16'h3a7e;
        explut[180] = 16'h39a4;
        explut[181] = 16'h38cb;
        explut[182] = 16'h37f2;
        explut[183] = 16'h371a;
        explut[184] = 16'h3643;
        explut[185] = 16'h356c;
        explut[186] = 16'h3496;
        explut[187] = 16'h33c1;
        explut[188] = 16'h32ec;
        explut[189] = 16'h3217;
        explut[190] = 16'h3143;
        explut[191] = 16'h3070;
        explut[192] = 16'h2f9d;
        explut[193] = 16'h2ecb;
        explut[194] = 16'h2df9;
        explut[195] = 16'h2d28;
        explut[196] = 16'h2c58;
        explut[197] = 16'h2b88;
        explut[198] = 16'h2ab9;
        explut[199] = 16'h29ea;
        explut[200] = 16'h291c;
        explut[201] = 16'h284e;
        explut[202] = 16'h2781;
        explut[203] = 16'h26b4;
        explut[204] = 16'h25e8;
        explut[205] = 16'h251d;
        explut[206] = 16'h2452;
        explut[207] = 16'h2388;
        explut[208] = 16'h22be;
        explut[209] = 16'h21f5;
        explut[210] = 16'h212c;
        explut[211] = 16'h2064;
        explut[212] = 16'h1f9c;
        explut[213] = 16'h1ed5;
        explut[214] = 16'h1e0e;
        explut[215] = 16'h1d48;
        explut[216] = 16'h1c83;
        explut[217] = 16'h1bbe;
        explut[218] = 16'h1afa;
        explut[219] = 16'h1a36;
        explut[220] = 16'h1972;
        explut[221] = 16'h18b0;
        explut[222] = 16'h17ed;
        explut[223] = 16'h172c;
        explut[224] = 16'h166a;
        explut[225] = 16'h15aa;
        explut[226] = 16'h14e9;
        explut[227] = 16'h142a;
        explut[228] = 16'h136b;
        explut[229] = 16'h12ac;
        explut[230] = 16'h11ee;
        explut[231] = 16'h1130;
        explut[232] = 16'h1073;
        explut[233] = 16'h0fb6;
        explut[234] = 16'h0efa;
        explut[235] = 16'h0e3f;
        explut[236] = 16'h0d84;
        explut[237] = 16'h0cc9;
        explut[238] = 16'h0c0f;
        explut[239] = 16'h0b56;
        explut[240] = 16'h0a9c;
        explut[241] = 16'h09e4;
        explut[242] = 16'h092c;
        explut[243] = 16'h0874;
        explut[244] = 16'h07bd;
        explut[245] = 16'h0707;
        explut[246] = 16'h0651;
        explut[247] = 16'h059b;
        explut[248] = 16'h04e6;
        explut[249] = 16'h0431;
        explut[250] = 16'h037d;
        explut[251] = 16'h02ca;
        explut[252] = 16'h0217;
        explut[253] = 16'h0164;
        explut[254] = 16'h00b2;
        explut[255] = 16'h0000;
    end

    always @ (posedge clk) if(cen) begin
        exp <= explut[addr];
    end

endmodule
