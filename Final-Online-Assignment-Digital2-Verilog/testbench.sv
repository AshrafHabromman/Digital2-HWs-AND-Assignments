// Code your testbench here
// or browse Examples
`timescale 1ns / 1 ps

module test;
  
  reg [13:0] Data;
  reg [3:0] Divisor;
  reg  Reset, clk, E;
  wire [2:0] CRC;
  integer i;
  ASM uut(.Data(Data), .Divisor(Divisor), .Reset(Reset), .clk(clk), .E(E), .CRC(CRC));
  
  initial 
    begin 
      $dumpfile("dump.vcd");
	  $dumpvars(1);
      
      clk = 0;
      #(10*2);
      Reset = 0;
      #(10*5);			//2 cyc
      Reset = 1;
      #(10*3);			//3 cyc
      Data = 14'b11010011101100;
      Divisor = 4'b1011;
      E = 1 ; 
      #(10*4);			//4 cyc
      E = 0 ;
      #(10*50);			//4 cyc
      Data = 14'b11000110000110;
      Divisor = 4'b1011;
      E = 1 ; 
      #(10*4);			//4 cyc
      E = 0 ;
      #(10*50);
      #(10*4);
	
    end
  
  
   initial 
     begin
       for(i =0 ; i<130; i = i+1)
         begin
           #10 clk <= ~clk;
         end
     end

  
  
endmodule
