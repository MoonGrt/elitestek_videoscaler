`timescale 1ns / 1ps
//****************************************Copyright (c)***********************************//
//原子哥在线教学平台：www.yuanzige.com
//抿术支持：www.openedv.com
//淘宝店铺：http://openedv.taobao.com 
//关注微信公众平台微信号："正点原子"，免费获取ZYNQ & FPGA & STM32 & LINUX资料
//版权承有，盗版必究
//Copyright(C) 正点原子 2018-2028
//All rights reserved
//----------------------------------------------------------------------------------------
// File name:           tmds_decoder
// Descriptions:        HDMI数据解码模块
//----------------------------------------------------------------------------------------
// Created by:          正点原子
// Created date:        2020/5/8 9:30:00
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
//****************************************************************************************

module tmds_decoder #(   
  parameter kCtlTknCount = 128,    //检测到控制字符的最低持续个数
  parameter kTimeoutMs = 50,       //未检测到控制字符的最大时间间隔
  parameter kRefClkFrqMHz = 200    //参考时钟频率
)(
    input              arst        ,   
    input              pixelclk    ,   //TMDS clock x1 (CLKDIV)
    input              refclk      ,   //200 MHz reference clock
    input              prst        ,   //Synchronous reset to restart lock procedure
    input   [9:0]      datain   	 ,   //TMDS data channel positive
    input   [1:0]      potherchrdy ,   //另外2组数据同步完成信号 
    input   [1:0]      potherchvld ,   //另外2组数据校准完成信号 
    output             palignerr   ,   //校准错误信号
    output             pc0         ,   //控制信号
    output             pc1         ,   //控制信号
    output             pmerdy      ,   //数据同步完成信号 
    output             pmevld      ,   //数据校准完成信号
    output             pvde        ,   //数据有效使能
    output   [7:0]     pdatain     ,   //解码后8bit颜色数据
    output   [4:0]     peyesize        //连续监测到控制字符的延迟值的次数

    );
    
//wire define 
wire                            pc0;           //控制信号
wire                            pc1;           //控制信号
wire                            pvde;          //数据有效使能 
wire  [7:0]                     pdatain;       //解码后的8bit颜色数据
wire  [4:0]                     peyesize;      //连续监测到控制字符的延迟值的次数
wire  [9:0]                     pdatainbnd;    //同步后的10bit并行数据
wire  [9:0]                     pdatainraw;    //转化后的10bit并行数据
wire                            pmerdy_int;    //数据同步完成信号
wire                            paligned;      //数据校准完成信号
wire                            palignerr_int; //校准错误信号
wire                            pbitslip;      //字对齐移动信号

//*****************************************************
//**                    main code
//***************************************************** 

assign  palignerr = palignerr_int;  //校准错误信号
assign  pmevld = paligned;          //数据校准完成信号
assign  pmerdy = pmerdy_int;        //数据同步完成信号

frame_bitslip u_bitslip (
/*i*/.clk     	(pixelclk),
/*i*/.rstn    	(~arst),
/*i*/.bitslip 	(pbitslip),
/*i*/.data_in 	(datain),
/*o*/.data_out	(pdatainraw)
);

 phasealign_v1 u_phasealgin(
/*i*/.clk					(pixelclk),
/*i*/.rst_n				(~arst),
/*i*/.vin					(pdatainraw),
/*o*/.bitslip 		(pbitslip),
/*o*/.aligned 	  (paligned)
);
//8b/10b解码模块  
decoder u_decoder(
	.pixelclk    (pixelclk),
    .pdatainbnd  (pdatainbnd),
	.potherchrdy (potherchrdy),
	.pmerdy_int  (pmerdy_int),

	.pc0         (pc0),	
	.pc1         (pc1),	
	.pvde        (pvde),	
	.pdatain	 (pdatain)
    );  

             
//字对齐校准模块    
// phasealign #(
//     .kTimeoutMs (kTimeoutMs),   
//     .kRefClkFrqMHz (kRefClkFrqMHz),  
//     .kCtlTknCount (kCtlTknCount)  	 
// )u_phasealign(
//    .prst       (prst),
//	.arst       (arst),
//    .pixelclk   (pixelclk),
//	.refclk     (refclk),
//    .pdata      (pdatainraw),
//    .pbitslip   (pbitslip),	
//    .paligned   (paligned),
//    .perror     (palignerr_int) );

//数据同步模块
channelbond u_channelbond(
  .clk           (pixelclk),
  .rawdata       (pdatainraw),
  .iamvld        (paligned),
  .other_ch0_vld (potherchvld[0]),
  .other_ch1_vld (potherchvld[1]),
  .other_ch0_rdy (potherchrdy[0]),
  .other_ch1_rdy (potherchrdy[1]),
  .iamrdy        (pmerdy_int),
  .sdata         (pdatainbnd)
);
  
endmodule
