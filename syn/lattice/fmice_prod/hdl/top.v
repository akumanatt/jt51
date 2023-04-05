
module top (
    input           ym_p1,
    input           ym_ic_n,
    input           ym_a0,
    input           ym_wr_n,
    input           ym_rd_n,
    input           ym_cs_n,
    inout   [7:0]   ym_d,
    output          ym_irq_n,
    output          ym_ct1,
    output          ym_ct2,

    output          dac_dat,
    output          dac_mclk,
    output          dac_bclk,
    output          dac_lrclk
);

wire    [7:0]   dout;
wire            sample;
wire    [15:0]  left_data;
wire    [15:0]  right_data;
reg             p1;

assign ym_d = ym_rd_n ? dout : 8'bZ;
always @(posedge ym_p1) p1 <= !p1;

jt51 u_jt51(
    .rst    ( !ym_ic_n      ),
    .clk    ( ym_p1         ),
    .cen    ( 1'b1          ),
    .cen_p1 ( p1            ),
    .cs_n   ( ym_cs_n       ),
    .wr_n   ( ym_wr_n       ),
    .a0     ( ym_a0         ),
    .din    ( ym_d          ),
    .dout   ( dout          ),

    .ct1    ( ym_ct1        ),
    .ct2    ( ym_ct2        ),
    .irq_n  ( ym_irq_n      ),

    .xleft  ( left_data     ),
    .xright ( right_data    )
);

dacif u_dac(
    .rst            ( !ym_ic_n      ),
    .clk            ( ym_p1         ),

    .left_data      ( left_data     ),
    .right_data     ( right_data    ),

    .dac_lrck       ( dac_lrclk     ),
    .dac_bck        ( dac_bclk      ),
    .dac_data       ( dac_dat       )
);

// use internal 48MHz oscillator for DAC system clock, outputting ~24MHz
SB_HFOSC #( .CLKHF_DIV("0b01") ) u_osc(
    .CLKHFEN    ( 1'b1     ),
    .CLKHFPU    ( 1'b1     ),
    .CLKHF      ( dac_mclk )
);

endmodule