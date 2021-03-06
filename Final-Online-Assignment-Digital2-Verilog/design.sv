// Code your design here

module ASM (Data, Divisor, clk, Reset, E, CRC);
  
  input [13:0] Data;
  input [3:0] Divisor;
  input Reset, clk, E;
  output reg [2:0] CRC;
  integer i ;
  
  
  
  reg [16:0]A, B; 
  
  reg [3:1] Current_State, Next_State;
  parameter t0 = 2'b000, t1 = 2'b001, t2 = 2'b010, t3 = 2'b011, t4 = 2'b100, t5 = 2'b101;
  
  always @(Current_State, E,A)
    begin
      case (Current_State)
        
        t0: 
          begin 
            if(E == 1)
              Next_State = t1;
            else if(E == 0)
              Next_State = t0;
          end
        
        t1: Next_State = t2;
        t2: Next_State = t3;
        t3:
          begin
            if(A[16:3] == 0)
              begin
               Next_State = t0;
               
              end
            else if(A[16:3] != 0)
              Next_State = t4;
          end
        
        t4: Next_State = t4;
        t5:
          begin
            if(A[i] == 0)
              Next_State = t4;
            else if(A[i] == 1)
              Next_State = t2;
          end
          
      endcase
      
      
    end
  
  always @(negedge Reset, posedge clk)
    begin
      if (Reset == 0)
        Current_State <= t0;
      else
        Current_State <= Next_State;
      
    end
  
  
  always @(posedge clk)
    begin
      
      case(Current_State)
         
          
          t1:
          begin
            A = {Data,3'b000};
            B = {Divisor, 13'b0000000000000};
            i = 16;
          end
          
          t2: A <= A ^ B;
          t3:
            if(A[16:3]==0)
               CRC = A[2:0];
          t4:
          begin
            B <= B >> 1;
            i = i-1;
          end
          

      endcase
      end
           
           
endmodule 
