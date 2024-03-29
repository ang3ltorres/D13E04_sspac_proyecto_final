`timescale 1ns/1ns

// Creacion del modulo
module REGISTRO
(
	input [4:0]READ_REGISTER1,
	input [4:0]READ_REGISTER2,
	input [31:0]WRITE_DATA,
	input REG_WRITE,
	input [4:0]WRITE_REGISTER,

	output reg [31:0]READ_1,
	output reg [31:0]READ_2
);

// Registro cables
reg [31:0] registro [31:0];

// Cargar datos al banco de registro
initial
begin
	$display("Cargando datos del registro...");
	$readmemb("REGISTRO.mem", registro);
end

// Bloque always
always @*
begin
	if (REG_WRITE)
	begin
		registro[WRITE_REGISTER] = WRITE_DATA;
	end

	READ_1 <= registro[READ_REGISTER1];
	READ_2 <= registro[READ_REGISTER2];
end
endmodule : REGISTRO
