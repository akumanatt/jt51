/*  This file is part of JT51.

    JT51 is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    JT51 is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with JT51.  If not, see <http://www.gnu.org/licenses/>.

    Author: Jose Tejada Gomez. Twitter: @topapate
    Version: 1.1 Date: 14- 4-2017
    Version: 1.0 Date: 27-10-2016
    */


module jt51_acc(
    input                   rst,
    input                   clk,
    input                   cen,
    input                   m1_enters,
    input                   m2_enters,
    input                   c1_enters,
    input                   c2_enters,
    input                   op31_acc,
    input           [1:0]   rl_I,
    input           [2:0]   con_I,
    input   signed  [RES-3:0]  op_out,
    input                   ne,     // noise enable
    input   signed  [11:0]  noise_mix,
    output  signed  [15:0]  left,
    output  signed  [15:0]  right,
`ifdef FMICE
    output  reg signed  [23:0]  xleft,  // exact outputs
    output  reg signed  [23:0]  xright
`else
    output  reg signed  [15:0]  xleft,  // exact outputs
    output  reg signed  [15:0]  xright
`endif
);
`ifdef FMICE
parameter RES = 24;
`else
parameter RES = 16;
`endif

reg signed [RES-3:0] op_val;

always @(*) begin
    if( ne && op31_acc ) // cambiar a OP 31
        op_val = { {2{noise_mix[11]}}, noise_mix, {RES-16{1'b0}} };
    else
        op_val = op_out;
end

reg sum_en;

always @(*) begin
    case ( con_I )
        3'd0,3'd1,3'd2,3'd3:    sum_en = m2_enters;
        3'd4:                   sum_en = m1_enters | m2_enters;
        3'd5,3'd6:              sum_en = ~c1_enters;
        3'd7:                   sum_en = 1'b1;
        default:                sum_en = 1'bx;
    endcase
end

wire ren = rl_I[1];
wire len = rl_I[0];
reg signed [RES:0] pre_left, pre_right;
wire signed [RES-1:0] total;
wire signed [RES:0] total_ex = {total[RES-1],total};

reg sum_all;

wire rst_sum = c2_enters;
//wire rst_sum = c1_enters;
//wire rst_sum = m1_enters;
//wire rst_sum = m2_enters;

function signed [RES-1:0] lim16;
    input signed [RES:0] din;
    lim16 = !din[RES] &&  din[RES-1] ? {1'b0, {RES-1{1'b1}}} :
           ( din[RES] && !din[RES-1] ? {1'b1, {RES-1{1'b0}}} : din[RES-1:0] );
endfunction


always @(posedge clk) begin
    if( rst ) begin
        sum_all <= 1'b0;
    end
    else if(cen) begin
        if( rst_sum )  begin
            sum_all <= 1'b1;
            if( !sum_all ) begin
                pre_right <= ren ? total_ex : 0;
                pre_left  <= len ? total_ex : 0;
            end
            else begin
                pre_right <= pre_right + (ren ? total_ex : 0);
                pre_left  <= pre_left  + (len ? total_ex : 0);
            end
        end
        if( c1_enters ) begin
            sum_all <= 1'b0;
            xleft  <= lim16(pre_left);
            xright <= lim16(pre_right);
        end
    end
end

reg  signed [RES-1:0] opsum;

`ifdef FMICE
    wire signed [31:0] opsum10;

    SB_MAC16 #(
        .TOPOUTPUT_SELECT( 2'b00 ),     // wire add/sub
        .TOPADDSUB_LOWERINPUT( 2'b00 ), // A input
        .TOPADDSUB_UPPERINPUT( 1'b1 ),  // C input
        .TOPADDSUB_CARRYSELECT( 2'b10 ),// accum from bottom
        .BOTOUTPUT_SELECT( 2'b00 ),     // wire add/sub
        .BOTADDSUB_LOWERINPUT( 2'b00 ), // B input
        .BOTADDSUB_UPPERINPUT( 1'b1 ),  // D input
        .BOTADDSUB_CARRYSELECT( 2'b00 ),// 0
        .MODE_8x8( 1'b1 )
    ) u_mac16 (
        .B ( total[15:0] ),
        .A ( {{8{total[23]}}, total[23:16]} ),
        .D ( op_val[15:0] ),
        .C ( {{10{op_val[21]}}, op_val[21:16]} ),
        .ADDSUBTOP ( 1'b0 ),
        .ADDSUBBOT ( 1'b0 ),
        .O ( opsum10 )
    );
`else
    wire signed [16:0] opsum10 = {{3{op_val[13]}},op_val}+{total[15],total};
`endif

always @(*) begin
    if( rst_sum )
        opsum = sum_en ? { {2{op_val[RES-3]}}, op_val } : 0;
    else begin
        if( sum_en )
            if( opsum10[RES]==opsum10[RES-1] )
                opsum = opsum10[RES-1:0];
            else begin
                opsum = opsum10[RES] ? {1'b1, {RES-1{1'b0}}} : {1'b0, {RES-1{1'b1}}};
            end
        else
            opsum = total;
    end
end

jt51_sh #(.width(RES),.stages(8),.bram(1)) u_acc(
    .rst    ( rst       ),
    .clk    ( clk       ),
    .cen    ( cen       ),
    .din    ( opsum     ),
    .drop   ( total     )
);


`ifdef FMICE

assign left   = 16'd0;
assign right  = 16'd0;

`else

wire signed [9:0] left_man, right_man;
wire [2:0] left_exp, right_exp;

jt51_exp2lin left_reconstruct(
    .lin( left      ),
    .man( left_man  ),
    .exp( left_exp  )
);

jt51_exp2lin right_reconstruct(
    .lin( right     ),
    .man( right_man ),
    .exp( right_exp )
);

jt51_lin2exp left2exp(
  .lin( xleft    ),
  .man( left_man ),
  .exp( left_exp ) );

jt51_lin2exp right2exp(
  .lin( xright    ),
  .man( right_man ),
  .exp( right_exp ) );

`endif

`ifdef DUMPLEFT

reg skip;

wire signed [15:0] dump = left;

initial skip=1;

always @(posedge clk)
    if( c1_enters && (!skip || dump) && cen) begin
        $display("%d", dump );
        skip <= 0;
    end

`endif

endmodule
