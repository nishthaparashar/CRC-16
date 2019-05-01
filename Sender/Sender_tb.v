`include "Sender.v"
module sender_tb;

reg [22:0] message;
wire [38:0] encoded_message;

Sender_CRC_16 dut(message,encoded_message);


initial
begin

$display ("				Sender Side				");

message = 23'b11001010100001100100001;
#10;


message = 23'b11111111111111111111111;

#10;
 

message = 23'b10101010101010101010101;

#10;

message = 23'b00001111000011110010101;

#10;

message = 23'b10000100001000100010001;

#10;

end

initial
begin

$monitor ($time ," message = %b  encoded_message =%b",message,encoded_message);

#100;
$finish;

end
endmodule