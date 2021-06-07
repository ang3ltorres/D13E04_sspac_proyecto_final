`timescale 1ns/1ns

// Creacion del modulo
module MEM
(
	input MEM_WRITE, // WRITE
	input MEM_READ, // READ
	input [31:0]WRITE_DATA, // Dato
	output reg [31:0]READ_DATA, // Salida (Si estamos leyendo)
	input [31:0]ADRESS // Direccion donde estamos apuntando
);

// Registro / Cables
reg [31:0] memory [31:0]; // <-- Memoria
/*
initial begin
	memory[0] = 32'd30;
end
*/

// Bloque always
always @*
begin
	if (MEM_WRITE) // Modo WRITE
	begin
		memory[ADRESS] = WRITE_DATA; // <-- Escribir
		READ_DATA = 32'dx;
	end

	if (MEM_READ) // Modo READ
	begin
		READ_DATA = memory[ADRESS]; // <-- Leer
	end
end

endmodule : MEM