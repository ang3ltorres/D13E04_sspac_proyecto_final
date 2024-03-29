`timescale 1ns/1ns

module INSTR_MEM
(
	input [31:0] READ_ADRESS,
	output reg [31:0] INSTRUCTION
);

reg [7:0] mem [399:0];

// Cargar datos al banco de registro
initial
begin
	$display("Cargando instrucciones...");
	$readmemb("MEM_INST.mem", mem);
end

always @*
begin
	INSTRUCTION <= {mem[READ_ADRESS], mem[READ_ADRESS+2'd1], mem[READ_ADRESS+2'd2], mem[READ_ADRESS+2'd3]};
end

endmodule : INSTR_MEM
