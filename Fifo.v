module FIFO_sync #(
      parameter data_width = 32,
      parameter depth = 8)
      (
      input clk,
      input rst_n,
      input cs,
      input wr_en,
      input rd_en,
      input [data_width-1:0] data_in,
      output reg [data_width-1:0] data_out,
      output empty,
      output full
    );
    localparam fifo_depth_log = $clog2(depth);
    
    reg [data_width-1:0] fifo [0:depth-1];//depth 8  0to7 with 32 bits at each depth
    
    reg [fifo_depth_log:0] wptr;
    reg [fifo_depth_log:0] rptr;
    
    //write
    always@(posedge clk or negedge rst_n)
     begin
      if(!rst_n)
       wptr <= 0;
      else if (cs && wr_en && !full) begin
       fifo[wptr[fifo_depth_log-1:0]] <= data_in;
        wptr <= wptr + 1'b1;
      end
     end
     
     //read
     always@(posedge clk or negedge rst_n)
      begin 
       if (!rst_n)
            rptr <= 0;
       else if (cs && rd_en && !empty) begin
        data_out <= fifo[rptr[fifo_depth_log-1:0]];
        rptr <= rptr + 1'b1;
       end
      end
      
    //ful&empty logic    
        assign empty = (rptr == wptr);
        assign full = (rptr== {~wptr[fifo_depth_log] , wptr[fifo_depth_log-1:0]});
endmodule
