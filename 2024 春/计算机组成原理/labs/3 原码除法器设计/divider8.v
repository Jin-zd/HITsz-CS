`timescale 1ns / 1ps

module divider (
    input  wire       clk,
    input  wire       rst,
    input  wire [7:0] x,
    input  wire [7:0] y,
    input  wire       start,
    output reg  [7:0] z,
    output reg  [7:0] r,
    output reg        busy
);
    // 可变位宽
    localparam WIDTH = 8;

    // 状态机状态
    localparam Div_Free = 2'b00;    // 空闲
    localparam Div_On = 2'b01;      // 运行
    localparam Div_Signed = 2'b10;  // 结果符号处理
    localparam Div_Done = 2'b11;    // 结果输出

    reg [WIDTH - 1:0] reg1;
    reg [WIDTH - 1:0] reg2;

    // 存储被除数和除数的补码
    always @(posedge clk) begin
        if (rst) begin
            reg1 <= 0;
            reg2 <= 0;
        end
        else if (start) begin
            reg1 <= x[WIDTH-1]?{x[WIDTH-1], ~x[WIDTH-2:0] + 1}: x;
            reg2 <= y[WIDTH-1]?{y[WIDTH-1], ~y[WIDTH-2:0] + 1}: y;
        end
    end


    wire [WIDTH:0] sub;
    reg [5:0] cnt;
    // dividend 低 WIDTH 位保存被除数和中间结果，第 i 次迭代结束， 
    // dividend[i: 0] 保存中间结果，dividend[WIDTH - 1: i + 1] 保存被除数中未参与运算的部分
    reg [WIDTH*2:0] dividend;
    reg [WIDTH - 1:0] divisor;

    reg[WIDTH - 1:0] z_temp;
    reg[WIDTH - 1:0] r_temp;

    reg[1: 0] state;
    reg[1: 0] next_state;

    // 被除数与除数绝对值的差, dividend[WIDTH*2-1: WIDTH] 为每次迭代的被减数
    assign sub = {1'b0, dividend[WIDTH*2 - 1: WIDTH]} - {1'b0, divisor};

    // 状态机转移
    always @(posedge clk) begin
        if (rst) begin
            state <= Div_Free;
        end
        else begin
            state <= next_state;
        end
    end

    // 状态机转移判断
    always @(*) begin
        case(state)
            Div_Free: begin
                if (start) begin
                    next_state = Div_On;
                end
                else begin
                    next_state = Div_Free;
                end
            end  
            Div_On: begin
                if (cnt != WIDTH) begin
                    next_state = Div_On;
                end
                else begin
                    next_state = Div_Signed;
                end
            end
            Div_Signed: begin
                next_state = Div_Done;
            end
            Div_Done: begin
                if (!busy) begin
                    next_state = Div_On;
                end
                else begin
                    next_state = Div_Free;
                end
            end
        endcase
    end

    // 状态机运行逻辑
    always @(posedge clk) begin
        if (rst) begin
            state <= Div_Free;
            busy <= 0;
            z_temp <= 0;
            r_temp <= 0;
        end
        else begin
            case(state)
                Div_Free: begin
                    if (start) begin
                        busy <= 1;
                        cnt <= 0;
                        // 装入被除数和除数的绝对值
                        dividend[WIDTH*2: WIDTH+1] <= 0;
                        dividend[0] <= 0;
                        dividend[WIDTH:1] <= {1'b0, x[WIDTH - 2: 0]};
                        divisor <= {1'b0, y[WIDTH - 2: 0]};
                    end 
                    else begin
                        busy <= 0;
                        z_temp <= 0;
                        r_temp <= 0;
                    end
                end
                Div_On: begin
                    // 根据差值的符号进行移位和上商
                    if (cnt != WIDTH) begin
                        if (sub[WIDTH]) begin
                            dividend <= {dividend[WIDTH*2 - 1: 0], 1'b0};
                        end
                        else begin
                            dividend <= {sub[WIDTH-1:0], dividend[WIDTH-1:0], 1'b1};
                        end
                        cnt <= cnt + 1;
                    end
                end
                Div_Signed: begin
                    // 根据被除数和除数符号处理商和余数
                    if (reg1[WIDTH - 1] ^ reg2[WIDTH - 1]) begin
                        dividend[WIDTH-1:0] <= ~dividend[WIDTH-1:0] + 1;
                    end
                    if (reg1[WIDTH - 1] ^ dividend[WIDTH*2]) begin
                        dividend[WIDTH*2:WIDTH+1] <= ~dividend[WIDTH*2:WIDTH+1] + 1;
                    end
                    cnt <= 0;
                end
                Div_Done: begin
                    // 将补码输出转换为原码输出
                    busy <= 0;
                    if (dividend[WIDTH - 1]) begin
                        z_temp <= {dividend[WIDTH - 1], ~dividend[WIDTH - 2: 0] + 1};
                    end
                    else begin
                        z_temp <= dividend[WIDTH - 1: 0];
                    end
                    if (dividend[WIDTH*2 - 1]) begin
                        r_temp <= {dividend[WIDTH*2], ~dividend[WIDTH*2 - 1: WIDTH + 1] + 1};
                    end
                    else begin
                        r_temp <= dividend[WIDTH*2: WIDTH + 1];
                    end
                end
            endcase
        end
    end

    // 延时一拍输出结果
    always @(posedge clk) begin
        z <= z_temp;
        r <= r_temp;
    end
endmodule
