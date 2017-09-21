module Register(clk,INaddr,IN,OUT1addr,OUT1,OUT2addr,OUT2);
	input clk;
 input [2:0] INaddr;
 input [7:0] IN;
 input [2:0] OUT1addr;
 output[7:0] OUT1;
 input [2:0] OUT2addr;
 output[7:0] OUT2;

reg [8:0] reg0, reg1, reg2, reg3,reg4,reg5,reg6,reg7;
assign OUT1 = 	OUT1addr == 0 ? reg0 :
				OUT1addr == 1 ? reg1 :
				OUT1addr == 2 ? reg2 :
				OUT1addr == 3 ? reg3 :
				OUT1addr == 4 ? reg4 :
				OUT1addr == 5 ? reg5 :
				OUT1addr == 6 ? reg6 :
				OUT1addr == 7 ? reg7 : 0;


assign OUT2 = 	OUT2addr == 0 ? reg0 :
				OUT2addr == 1 ? reg1 :
				OUT2addr == 2 ? reg2 :
				OUT2addr == 3 ? reg3 :
				OUT2addr == 4 ? reg4 :
				OUT2addr == 5 ? reg5 :
				OUT2addr ==  6? reg6 :
				OUT2addr == 7 ? reg7 : 0;

 
 always @(negedge clk) 
 	begin
 		case(INaddr)
	 		3'b000: reg0=IN;
	 		3'b001: reg1=IN;
	 		3'b010: reg2=IN;
	 		3'b011: reg3=IN;
	 		3'b100: reg4=IN;
	 		3'b101: reg5=IN;
	 		3'b110: reg6=IN;
	 		3'b111: reg7=IN;
	 	endcase
	 end // always @ (negedge clk)
endmodule


module stimulus;
	reg clk;
 	reg [2:0] INaddr,OUT1addr,OUT2addr;
 	reg [7:0] IN;
 	wire [7:0] OUT1,OUT2;

	Register r1 (clk,INaddr,IN,OUT1addr,OUT1,OUT2addr,OUT2);
		initial begin
		$dumpfile("test.vcd");
		$dumpvars(0,stimulus); 
		
		#3
		clk=1;
		INaddr=1;
		IN=2;
		#3
		clk=0;
		
		$monitor("INaddre=%d IN=%d OUT1addr=%d OUT1=%d OUT2addr=%d OUT2=%d",
			INaddr,IN,OUT1addr,OUT1,OUT2addr,OUT2);
		
		#3
		clk=1;
		INaddr=2;
		IN=4;

		#3
		clk=0;

		#3
		clk=1;
		INaddr=3;
		IN=5;
		#3
		clk=0;

		#3
		clk=1;
		INaddr=4;
		IN=0;

		#3
		clk=0;

		#3
		clk=1;
		INaddr=5;
		IN=256;
		#3
		clk=0;

		#3
		OUT1addr=1;
		OUT2addr=2;
		#3
		clk=0;
		
		$finish;
		end
endmodule