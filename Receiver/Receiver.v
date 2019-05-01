`include "XOR.v"

module Receiver(
input [38:0] encoded_message,
output [38:0] received_message,
output CRC_flag
);


wire [38:0] append_message;

wire [21:0] shift_message;

wire [16:0] operand_a,operand_a_1,operand_a_2,operand_a_3,operand_a_4,operand_a_5,operand_a_6,operand_a_7,operand_a_8,operand_a_9,operand_a_10,operand_a_11,operand_a_12,operand_a_13,operand_a_14,operand_a_15,operand_a_16,operand_a_17,operand_a_18,operand_a_19,operand_a_20,operand_a_21,operand_a_22,operand_a_23;

wire [15:0] append_value; //rem


assign append_message = encoded_message;

assign operand_a = append_message[38:22];

assign shift_message = append_message[21:0];


XOR i1(operand_a,shift_message[21],operand_a_1);

XOR i2(operand_a_1,shift_message[20],operand_a_2);

XOR i3(operand_a_2,shift_message[19],operand_a_3);

XOR i4(operand_a_3,shift_message[18],operand_a_4);

XOR i5(operand_a_4,shift_message[17],operand_a_5);

XOR i6(operand_a_5,shift_message[16],operand_a_6);

XOR i7(operand_a_6,shift_message[15],operand_a_7);

XOR i8(operand_a_7,shift_message[14],operand_a_8);

XOR i9(operand_a_8,shift_message[13],operand_a_9);

XOR i10(operand_a_9,shift_message[12],operand_a_10);

XOR i11(operand_a_10,shift_message[11],operand_a_11);

XOR i12(operand_a_11,shift_message[10],operand_a_12);

XOR i13(operand_a_12,shift_message[9],operand_a_13);

XOR i14(operand_a_13,shift_message[8],operand_a_14);

XOR i15(operand_a_14,shift_message[7],operand_a_15);

XOR i16(operand_a_15,shift_message[6],operand_a_16);

XOR i17(operand_a_16,shift_message[5],operand_a_17);

XOR i18(operand_a_17,shift_message[4],operand_a_18);

XOR i19(operand_a_18,shift_message[3],operand_a_19);

XOR i20(operand_a_19,shift_message[2],operand_a_20);

XOR i21(operand_a_20,shift_message[1],operand_a_21);

XOR i22(operand_a_21,shift_message[0],operand_a_22);

//XOR i23(operand_a_21,shift_message[0],operand_a_22);

XOR i23(operand_a_22,1'b0,operand_a_23);

assign append_value = operand_a_23[16:1];


assign received_message = {encoded_message[38:16],append_value};

assign CRC_flag = !(&append_value);

endmodule