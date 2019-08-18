`timescale 1ns / 1ps

module clock_divide_module(clk_50Mhz, 
									//clk_10Mhz, 
									//clk_1Mhz, 
									//clk_100Khz, 
									//clk_10Khz, 
									//clk_1Khz//, 
									//clk_100Hz//, 
									//clk_10Hz, 
									clk_5Hz, 
									//clk_1Hz
									);
									
	input clk_50Mhz;
	//output clk_10Mhz;
 	//output clk_1Mhz;
	//output clk_100Khz;
 	//output clk_10Khz; 	
	//output clk_1Khz;
	//output clk_100Hz;
	//output clk_10Hz; 
	output clk_5Hz; 	
	//output clk_1Hz;
	
	//reg clk_10Mhz_int =0, 
	reg clk_1Mhz_int =0;
	reg clk_100Khz_int =0,	clk_10Khz_int =0,	clk_1Khz_int =0;
	reg clk_100Hz_int =0,	clk_10Hz_int =0, 	clk_5Hz_int =0, 	clk_1Hz_int =0;
	
	reg [7:0] count_1Mhz;
	reg [2:0] count_10Mhz, count_100Khz, count_10Khz, 	count_1Khz;
	reg [2:0] count_100Hz, 	count_10Hz, 	count_1Hz;
	
	//assign clk_10Mhz 	= clk_10Mhz_int;
	//assign clk_1Mhz	= clk_1Mhz_int;
	//assign clk_100Khz	= clk_100Khz_int;
	//assign clk_10Khz	= clk_10Khz_int;
	//assign clk_1Khz	= clk_1Khz_int;
	//assign clk_100Hz	= clk_100Hz_int;
	//assign clk_10Hz	= clk_10Hz_int;
	assign clk_5Hz		= clk_5Hz_int;
	//assign clk_1Hz		= clk_1Hz_int;
	
	/*Divide by 5 - 10Mhz
	always@(posedge clk_50Mhz) begin
		if (count_10Mhz < 4)
			count_10Mhz <= count_10Mhz + 3'b001;
		else 
			count_10Mhz <= 0;
		if (count_10Mhz < 2)
			clk_10Mhz_int <= 0;
		else
			clk_10Mhz_int <= 1;
		
	end
	*/
	//Divide by 50 - 1Mhz
	always@(posedge clk_50Mhz) begin
		if (count_1Mhz < 50)
			count_1Mhz <= count_1Mhz + 8'b00000001;
		else 
			count_1Mhz <= 0;
		if (count_1Mhz < 25)
			clk_1Mhz_int <= 0;
		else
			clk_1Mhz_int <= 1;
		
	end
	
	//Divide by 10 - 100Khz
	always@(posedge clk_1Mhz_int) begin
		if (count_100Khz != 4)
			count_100Khz <= count_100Khz + 3'b001;
		else begin
			count_100Khz <= 0;
			clk_100Khz_int = ~clk_100Khz_int;
		end
	end
	
	//Divide by 10 - 10Khz
	always@(posedge clk_100Khz_int) begin
		if (count_10Khz != 4)
			count_10Khz <= count_10Khz + 3'b001;
		else begin
			count_10Khz <= 0;
			clk_10Khz_int = ~clk_10Khz_int;
		end
	end
	
	//Divide by 10 - 1Khz
	always@(posedge clk_10Khz_int) begin
		if (count_1Khz != 4)
			count_1Khz <= count_1Khz + 3'b001;
		else begin
			count_1Khz <= 0;
			clk_1Khz_int = ~clk_1Khz_int;
		end
	end
	
	//Divide by 10 - 100Hz
	always@(posedge clk_1Khz_int) begin
		if (count_100Hz != 4)
			count_100Hz <= count_100Hz + 3'b001;
		else begin
			count_100Hz <= 0;
			clk_100Hz_int = ~clk_100Hz_int;
		end
	end
			
	//Divide by 10 - 10Hz
	always@(posedge clk_100Hz_int) begin
		if (count_10Hz != 4)
			count_10Hz <= count_10Hz + 3'b001;
		else begin
			count_10Hz <= 0;
			clk_10Hz_int = ~clk_10Hz_int;
		end
	end
	
		//Divide by 2 - 5Hz
	always@(posedge clk_10Hz_int) begin
		clk_5Hz_int = ~clk_5Hz_int;
	end
	
	//Divide by 10 - 1Hz
	always@(posedge clk_10Hz_int) begin
		if (count_1Hz != 4)
			count_1Hz <= count_1Hz + 3'b001;
		else begin
			count_1Hz <= 0;
			clk_1Hz_int = ~clk_1Hz_int;
		end
	end

endmodule
