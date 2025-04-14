module Noise_Generator_TB;

reg clk,rst;
reg [7:0] clear_data;
wire signed [7:0] noisy_signal;

always #5 clk = ~clk;
initial begin
clk=0;
rst=0;
clear_data=0;
#10
rst =1;
clear_data=1;
#10;
end

Noise_Generator uut(
.clk(clk),
.rst(rst),
.clear_data(clear_data),
.noisy_signal(noisy_signal)
);
endmodule

