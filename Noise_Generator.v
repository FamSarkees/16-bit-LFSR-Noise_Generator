module Noise_Generator #(parameter WIDTH=16)
( input wire clk,rst,
  input wire [7:0] clear_data,
  output reg signed [7:0] noisy_signal
);

reg  [WIDTH-1:0] LFSR_Data;
wire Feedback;

wire signed [3:0] noise = $signed(LFSR_Data[11:8])-4'sd8;

// 16-bit LFSR(primitive polynomial)
assign Feedback = LFSR_Data[15]^LFSR_Data[13]^
		  LFSR_Data[12]^LFSR_Data[10];

always @(posedge clk)
begin 
 if(!rst)
  LFSR_Data <= 16'hACE1;
else 
  LFSR_Data <= {LFSR_Data[14:0],Feedback};
end

always @(posedge clk)
begin 
  noisy_signal <= clear_data + noise;
end
endmodule
