module XOR(
input [16:0] operand_a,
input shift_message,
output [16:0] operand_next_a
);


wire [16:0] operand_b;
wire [16:0] intermediate_result;


assign operand_b = operand_a[16] ? 17'b1_1000_0000_0000_0101 : 17'd0;

assign intermediate_result = operand_a ^ operand_b;

assign operand_next_a = {intermediate_result[15:0],shift_message};

endmodule