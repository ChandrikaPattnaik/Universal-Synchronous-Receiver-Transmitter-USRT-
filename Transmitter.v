module Transmitter(so,ninto,clk,reset,load,data);

input clk,reset,load;
input [7:0] data;

output so,ninto;

reg ninto,so;
reg [3:0] ns,ps;

always@(posedge clk or posedge reset)
begin
	if(reset)
		ps <= 4'b0000;
	else
		ps <= ns;
end

always@(ps or load or reset)
begin

case(ps)

	4'b0000: begin
				so <= 1'b1;
				ninto <= 1'b0;

				if((~reset) && load)
					ns <= 4'b0001;
				else
					ns <= 4'b0000;
			 end	
			 
	4'b0001: begin
				so <= 1'b0;
				ninto <= 1'b1;
				ns <= 4'b0010;
			 end	
			 
	4'b0010: begin
				so <= data[0];
				ns <= 4'b0011;
			 end	
			 
	4'b0011: begin
				so <= data[1];
				ns <= 4'b0100;
			 end	
			 
	4'b0100: begin
				so <= data[2];
				ns <= 4'b0101;
			 end	

	4'b0101: begin
				so <= data[3];
				ns <= 4'b0110;
			 end	
			 
	4'b0110: begin
				so <= data[4];
				ns <= 4'b0111;
			 end	

	4'b0111: begin
				so <= data[5];
				ns <= 4'b1000;
			 end	
			 
	4'b1000: begin
				so <= data[6];
				ns <= 4'b1001;
			 end

	4'b1001: begin
				so <= data[7];
				ns <= 4'b0000;
			 end			 
endcase

end

endmodule