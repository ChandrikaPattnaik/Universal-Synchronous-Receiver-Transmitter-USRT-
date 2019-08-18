module Reciever(ninti,show,si,clk,reset,ien,read);

input clk,reset,ien,si,read;
output ninti;
output [7:0]show;

reg ninti;
reg [3:0] ns,ps;
reg [7:0] datarecieved;
reg [7:0] show;

always@(negedge clk or negedge reset)
begin
	if(~reset)
		ps <= 4'b0000;
	else
		ps <= ns;
end

always@(ps or ien or reset or si)
begin
	
case(ps)

4'b0000: begin
				ninti <= 1'b0;
				if(ien && (~si))
					ns <= 4'b0001;
				else
					ns <= 4'b0000;
			end
	
4'b0001: begin
				ninti <= 1'b1;
				ns <= 4'b0010;
			end	
			
4'b0010: begin
				ns <= 4'b0011;
			end

4'b0011: begin
				ns <= 4'b0100;
			end

4'b0100: begin
				ns <= 4'b0101;
			end

4'b0101: begin
				ns <= 4'b0110;
			end			
4'b0110: begin
				ns <= 4'b0111;
			end

4'b0111: begin
				ns <= 4'b1000;
			end

4'b1000: begin
				ns <= 4'b0000;
			end
	
endcase
end

always@(negedge clk)
begin
case(ps)

4'b0000: begin
				datarecieved <= 8'b0;
			end
	
4'b0001: begin
				datarecieved[0] <= si;
			end	
			
4'b0010: begin
				datarecieved[1] <= si;
			end

4'b0011: begin
				datarecieved[2] <= si;
			end

4'b0100: begin
				datarecieved[3] <= si;
			end

4'b0101: begin
				datarecieved[4] <= si;
			end			
4'b0110: begin
				datarecieved[5] <= si;
			end

4'b0111: begin
				datarecieved[6] <= si;
			end

4'b1000: begin
				datarecieved[7] <= si;
			end		
		
endcase
end

always@(negedge ninti)
begin
	if(read)				
		show <= datarecieved;
end		

endmodule	