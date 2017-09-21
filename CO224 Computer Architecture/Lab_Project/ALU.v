

module alu(out,DATA1,DATA2,Select);
	input [7:0]DATA1,DATA2;
	input [2:0] Select;
	output [7:0]out;
	reg out;
	always@(DATA1,DATA2,Select)
	begin
		case(Select)
			3'b000: out=DATA1;
			3'b001: out=DATA1+DATA2;
			3'b010: out=DATA1 & DATA2;
			3'b011: out=DATA1| DATA2; 
		//your code here//
		endcase
	end
endmodule


module stimulus;
	reg[7:0]a,b;
	reg [2:0] Select;
	wire [7:0] out;
	alu a1 (out,a,b,Select);
		initial begin
		$dumpfile("test.vcd");
		$dumpvars(0,stimulus); 
		Select=3'b000;
		a=8'b1111001;
		b=8'b0000010;
		
		$monitor("result=%d",out);
		
		#3
		a=8'b1111001;
		b=8'b0000010;
		Select=3'b001;
		#3
		a=8'b1111001;
		b=8'b0000010;
		Select=3'b010;
		#3
		a=8'b1111001;
		b=8'b0000010;
		Select=3'b011;
		$finish;
		end
endmodule