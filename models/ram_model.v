module ram_model(
    input clk,wr,
    inout [7:0]bus,
    input switch        // takes address if switch = 0 else takes memory element
);

    reg [7:0] mem[0:15]; // 16 of the 8bits array acting as RAM
    reg [3:0]address;
    initial begin
        mem[0] = 4'h7;
        mem[1] = 4'h6;
        mem[2] = 4'h5;
        mem[3] = 4'h4;
        mem[4] = 4'h3;
        mem[5] = 4'h2;
        mem[6] = 4'h1;
        mem[7] = 4'h5;
        mem[8] = 4'he;  //hehe
        mem[9] = 4'h7;
        mem[10] = 4'h8;
        mem[11] = 4'h9;
        mem[12] = 4'ha;
        mem[13] = 4'hb;
        mem[14] = 4'hc;
        mem[15] = 4'hd;
    end

    always@(posedge clk)
        begin
            if(wr)
                begin
                    if(switch)
                        mem[address] <= bus;
                    else
                        address <= bus[3:0];
                end
        end
    
    assign bus = (!wr) ? mem[address] : 8'bz;

endmodule






