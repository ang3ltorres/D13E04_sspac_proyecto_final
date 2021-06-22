`timescale 1ns/1ns

// Creacion del modulo
module TEST_BENCH();

reg clk;

TOP_LEVEL top_level
(
	.clk(clk)
);

always
#100 // CADA CICLO = 200ns
clk = ~clk;

initial
begin
	clk <= 1;
	#4000 //Suponemos que existen 20 instrucciones -> 20*200, aumentamos 200 para que se note el BEQ
	$finish;
end


endmodule : TEST_BENCH