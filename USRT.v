module USRT (NINTO,NINTI,Show,Clk,Reset,Load,Data,IEN,Read);
input Clk,Reset,Load,IEN,Read;
input [7:0] Data;
output NINTO,NINTI;
output [7:0] Show;

wire x;
wire Clk_5hz;
//Transmitter T(.so(x),.ninto(NINTO),.clk(Clk),.reset(Reset),.load(Load),.data(Data));
//Reciever R(.ninti(NINTI),.show(Show),.si(x),.clk(Clk),.reset(~Reset),.ien(IEN),.read(Read));
clock_divide_module Clock(.clk_50Mhz(Clk),.clk_5Hz(Clk_5hz));
Transmitter T(.so(x),.ninto(NINTO),.clk(Clk_5hz),.reset(Reset),.load(Load),.data(Data));
Reciever R(.ninti(NINTI),.show(Show),.si(x),.clk(Clk_5hz),.reset(~Reset),.ien(IEN),.read(Read));
endmodule
