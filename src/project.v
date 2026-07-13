/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0


`default_nettype none

// Module MUX 2:1 cơ bản
module mux2to1 (
    input wire i0,
    input wire i1,
    input wire sel,
    output wire y
);
    assign y = sel ? i1 : i0;
endmodule

// Top Module
module tt_um_thao_4to1_mux (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input  wire       ena,
    input  wire       clk,
    input  wire       rst_n
);
    // Logic 4:1 MUX
    wire y01, y23;
    mux2to1 m1 (.i0(ui_in[0]), .i1(ui_in[1]), .sel(ui_in[4]), .y(y01));
    mux2to1 m2 (.i0(ui_in[2]), .i1(ui_in[3]), .sel(ui_in[4]), .y(y23));
    mux2to1 m3 (.i0(y01), .i1(y23), .sel(ui_in[5]), .y(uo_out[0]));

    // Gán các chân không dùng về 0
    assign uo_out[7:1] = 7'b0;
    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;
endmodule
