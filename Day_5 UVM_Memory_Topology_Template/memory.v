module memory(clk_i,rst_i,wdata_i,addr_i,wr_rd_en_i,valid_i,rdata_o,ready_o);
parameter WIDTH=16;
parameter DEPTH=64;
parameter ADDR_WIDTH=$clog2(DEPTH);//this will calculate automatically 4
input clk_i;
input rst_i;
input wr_rd_en_i;
input valid_i;
input [WIDTH-1:0]wdata_i;
input [ADDR_WIDTH-1:0]addr_i;
output reg ready_o;
output reg [WIDTH-1:0]rdata_o;
integer i;
reg [WIDTH-1:0]mem[DEPTH-1:0];//this is the default declaration of memory
always@(posedge clk_i)begin
	if(rst_i == 1)begin
		ready_o=0;
    	rdata_o=0;
		for(i=0;i<DEPTH;i=i+1)
			mem[i]=0;
	end
	else begin
		if(valid_i == 1)begin
			ready_o=1;//handshaking is happening
			if(wr_rd_en_i == 1)
				mem[addr_i]=wdata_i;//write operation to the memory
			else
				rdata_o=mem[addr_i];//read from the memory
		end
		else 
			ready_o=0;//to stop the trandfer
	end
end
endmodule


