module MEM(
	input [31:0] Address,
	input [31:0] Data,
	input [1:0] WBControl,
	input Clk,
	input [1:0] MEMControl,
	output [31:0] AddressOut,
	output [31:0] DataOut,
	output [1:0] WBControlOut
);

	reg [31:0] AddressOut;
	reg [31:0] DataOut;
	reg [1:0] WBControlOut;

	wire [31:0] DataTemp;
	wire [6:0] AddressTemp;

	assign AddressTemp = Address[6:0];

	DataMemory DMEM(AddressTemp, Data, MEMControl[1], MEMControl[0], Clk, DataTemp);

	always@(negedge Clk) begin
		 AddressOut = Address;
		 DataOut = DataTemp;
		 WBControlOut = WBControl;
	end
endmodule
