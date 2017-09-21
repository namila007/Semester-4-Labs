module twosComplement(OUT,IN);
	input [7:0] IN;
	output signed [7:0] OUT;

	assign OUT=-IN;

endmodule

module stimulus;
	reg[7:0]a;
	wire signed [7:0] out;
	twosComplement a1 (out,a);
		initial begin
		$dumpfile("test.vcd");
		$dumpvars(0,stimulus); 
		
		
		 

		
		a=8'b0000001;
$monitor ("IN= %d ,OUT=%d",a,out);
		#2

		
		a=8'b0000010;
		#2
		$finish;
		end
endmodule 
