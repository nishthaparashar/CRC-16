`include "Receiver.v"
module Receiver_tb;

reg [38:0] encoded_message;
wire [38:0] received_message;
wire CRC_Flag;

Receiver dut(encoded_message,received_message,CRC_Flag);


initial
begin

$display ("			Receiver Side 			");

encoded_message =110010101000011001000011000110100000100;
#10;
encoded_message =111111111111111111111110000011000000010;
#10;
encoded_message =101010101010101010101010111101111111111;
#10;
encoded_message =000011110000111100101011001000100011011;
#10;
encoded_message =100001000010001000100010110001101001110;
#10;
end

initial
begin

$monitor ($time ," encoded_message = %b    Received_message =%b 	  Flag = %b ",encoded_message,received_message,CRC_Flag);

#40;
$finish;

end
endmodule