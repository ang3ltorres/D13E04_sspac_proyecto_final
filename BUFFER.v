`timescale 1ns/1ns
/////////////////////////////////
//          BUFFERS            //
/////////////////////////////////

/*******************************/
/*******************************/

/////////////////////////////////
//           IF/ID             //
/////////////////////////////////
module BUFFER_IF_ID
(
	input clk, // CLOCK

	// INPUTS
	input [31:0]IN1, // ADDER
	input [31:0]IN2, // INSTRUCCION MEMORY

	// OUTPUTS
	output reg [31:0]OUT1, // BUFFER ID/EX
	output reg [31:0]OUT2 // INSTRUCCION
);

always @(posedge clk)
begin
	OUT1 <= IN1;
	OUT2 <= IN2;
end

endmodule : BUFFER_IF_ID


/////////////////////////////////
//           ID/EX             //
/////////////////////////////////
module BUFFER_ID_EX
(
	input clk, // CLOCK

	// INPUTS
	input [31:0]IN1, // SHIFT LEFT JUMP / BUFFER IF/ID
	input [31:0]IN2, // BUFFER IF/ID
	input [31:0]IN3, // READ DATA 1
	input [31:0]IN4, // READ DATA 2
	input [31:0]IN5, // SIGN EXTEND
	input [4:0]IN6, // INSTRUCCION
	input [4:0]IN7, // INSTRUCCION

	input [1:0] WB_IN,
	input [3:0] M_IN,
	input [4:0] EX_IN,

	// OUTPUTS
	output reg [31:0]OUT1, // BUFFER EX/MEM
	output reg [31:0]OUT2, // ADDER
	output reg [31:0]OUT3, // ALU
	output reg [31:0]OUT4, // MUX / BUFFER EX/MEM
	output reg [31:0]OUT5, // SHIFT LEFT / ALU CONTROL
	output reg [4:0]OUT6, // MUX
	output reg [4:0]OUT7, // MUX

	output reg [1:0] WB_OUT,
	output reg [3:0] M_OUT,
	output reg [4:0] EX_OUT
);

always @(posedge clk)
begin
	OUT1 <= IN1;
	OUT2 <= IN2;
	OUT3 <= IN3;
	OUT4 <= IN4;
	OUT5 <= IN5;
	OUT6 <= IN6;
	OUT7 <= IN7;

	WB_OUT <= WB_IN;
	M_OUT <= M_IN;
	EX_OUT <= EX_IN;
end

endmodule : BUFFER_ID_EX


/////////////////////////////////
//           EX/MEM            //
/////////////////////////////////
module BUFFER_EX_MEM
(
	input clk, // CLOCK

	// INPUTS
	input [31:0]IN1, // BUFFER ID/EX
	input [31:0]IN2, // ADDER
	input IN3, // ZF
	input [31:0]IN4, // ALU RESULT
	input [31:0]IN5, // ID/EX
	input [4:0]IN6, // MUX

	input [1:0] WB_IN,
	input [3:0] M_IN,

	// OUTPUTS
	output reg [31:0]OUT1, // JUMP MUX (PC)
	output reg [31:0]OUT2, // PC MUX
	output reg OUT3, // BRANCH/PCSRC
	output reg [31:0]OUT4, // MEM ADRESS
	output reg [31:0]OUT5, // MEM WRITE DATA
	output reg [4:0]OUT6, // MEM/WB

	output reg [1:0] WB_OUT,
	output reg [3:0] M_OUT
);

always @(posedge clk)
begin
	OUT1 <= IN1;
	OUT2 <= IN2;
	OUT3 <= IN3;
	OUT4 <= IN4;
	OUT5 <= IN5;
	OUT6 <= IN6;

	WB_OUT <= WB_IN;
	M_OUT <= M_IN;
end

endmodule : BUFFER_EX_MEM


/////////////////////////////////
//          MEM/WB             //
/////////////////////////////////
module BUFFER_MEM_WB
(
	input clk, // CLOCK

	// INPUTS
	input [31:0]IN1, // MEM READ DATA
	input [31:0]IN2, // EX/MEM
	input [4:0]IN3, // EX/MEM

	input [1:0] WB_IN,

	// OUTPUTS
	output reg [31:0]OUT1, // MUX
	output reg [31:0]OUT2, // MUX
	output reg [4:0]OUT3, // GPR WRITE DATA

	output reg [1:0] WB_OUT
);

always @(posedge clk)
begin
	OUT1 <= IN1;
	OUT2 <= IN2;
	OUT3 <= IN3;

	WB_OUT <= WB_IN;
end

endmodule : BUFFER_MEM_WB