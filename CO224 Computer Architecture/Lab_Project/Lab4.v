module ALU(out,DATA1,DATA2,Select);	//module for ALU
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
		
		endcase
	end

endmodule

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
	 end 
endmodule



module twos_compliment(IN,OUT);		//twos complement
	input [7:0] IN;
	output signed [7:0] OUT;

	assign OUT=-IN;
endmodule

module multiplex(IN1,IN2,OUT,SELECT);		//multiplexer
	input [7:0] IN1,IN2;
	input SELECT;
	output [7:0] OUT;

	assign OUT = (SELECT) ? IN2 : IN1 ;
	
endmodule


module counter(clk,reset,addr);		//module program counter
	input clk,reset;
	output [31:0] addr;
	reg addr;

	always @(reset) begin
		addr = 32'h00000000;
	end

	always @(negedge clk) begin
		addr = addr + 1;
	end
endmodule

module CU(opcode,SELECT,mulx1,mulx2);	//control unit
	input [7:0] opcode;
	output [2:0] SELECT;
	output mulx1,mulx2;
	reg mulx1,mulx2;
	
	assign SELECT = opcode [2:0];
	always @(opcode) begin
		case(opcode)
			8'b00000000:begin 		
				mulx1 = 1'b1;
				mulx2 = 1'b0;
				end
			8'b00000001:begin 		
				mulx1 = 1'b1;
				mulx2 = 1'b0;
				end
			8'b00001001:begin 		
				mulx1 = 1'b1;
				mulx2 = 1'b1;
				end
			8'b00000010:begin 		
				mulx1 = 1'b1;
				mulx2 = 1'b0;
				end
			8'b00000011:begin 		
				mulx1 = 1'b1;
				mulx2 = 1'b0;
				end
			8'b00001000:begin 		
				mulx1 = 1'b0;
				end	
		endcase
			
	end
endmodule

module instruction_mem(Read_addr,Instruction_code);
	output [31:0] Instruction_code;
	reg Instruction_code;
	input [31:0] Read_addr;

	always @(Read_addr) begin
		case(Read_addr)
			32'h00000000: Instruction_code = 32'h080400FF;
			32'h00000001: Instruction_code = 32'h080600AA;
			32'h00000002: Instruction_code = 32'h080300BB;
			32'h00000003: Instruction_code = 32'h01050603;
			32'h00000004: Instruction_code = 32'h02010405;
			32'h00000005: Instruction_code = 32'h03020106;
			32'h00000006: Instruction_code = 32'h00070002;
			32'h00000007: Instruction_code = 32'h09040703;
		endcase
	end
endmodule

module instruction_reg(Instruction,clk,OPCODE,OUT1addr,OUT2addr,INaddr,Immediate);
	input [31:0] Instruction;
	input clk;
	output[2:0] OUT1addr,OUT2addr,INaddr;
	output [7:0] OPCODE,Immediate;
	
	
	assign INaddr = Instruction[18:16];
	assign OPCODE = Instruction[31:24];
	assign Immediate = Instruction[7:0];
	assign OUT1addr = Instruction[2:0];
	assign OUT2addr = Instruction[10:8];
endmodule

module for_processor_test();
	wire [2:0] SELECT,OUT1addr,OUT2addr,INaddr;
	wire mux1OUT,mux2OUT;
	reg clk,reset,reset_reg;
	wire [31:0] Read_addr,Instruction_code;
	wire [7:0] OPCODE,Immediate,OUT1,OUT2,RESULT,twosComplement,mux2out,mux1out;
	

	counter c1(clk,reset,Read_addr);
	instruction_mem instruct_mem1(Read_addr,Instruction_code);
	instruction_reg instruct_reg1(Instruction_code,clk,OPCODE,OUT1addr,OUT2addr,INaddr,Immediate);
	CU cu1(OPCODE,SELECT,mux1OUT,mux2OUT);
	Register regfile(clk,INaddr,RESULT,OUT1addr,OUT1,OUT2addr,OUT2);
	twos_compliment tcmplmnt(OUT1,twosComplement);
	multiplex mulx2(OUT1,twosComplement,mux2out,mux2OUT);
	multiplex mulx1(Immediate,mux2out,mux1out,mux1OUT);
	ALU alu(RESULT,mux1out,OUT2,SELECT);

	always #10 clk = ~clk;

	initial begin
		$dumpfile("wavedata.vcd");
		$dumpvars(0,for_processor_test);	
		clk = 0;
		reset = 1;
		reset = 0;
		reset_reg = 1;
		reset_reg = 0;
		#160 
		
		$finish;
	end

	initial begin
		while(1) begin
		#20 $display("INSTRUCTION=%h RESULT=%d",Instruction_code,RESULT);
		end
	end
endmodule







