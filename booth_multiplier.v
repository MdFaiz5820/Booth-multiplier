module booth_multiplier #(parameter N = 4)(
    input clk,
    input rst,
    input start,
    input signed [N-1:0] multiplicand,
    input signed [N-1:0] multiplier,
    output reg signed [(2*N)-1:0] product,
    output reg done
);

    reg signed [N:0] A, S;
    reg signed [2*N:0] P;
    reg [N:0] count;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            A <= 0;
            S <= 0;
            P <= 0;
            product <= 0;
            done <= 0;
            count <= 0;
        end else if (start) begin
            A <= {multiplicand, N+1'b0};       
            S <= {-multiplicand, N+1'b0};      
            P <= { {N{1'b0}}, multiplier, 1'b0 }; 
            count <= N;
            done <= 0;
        end else if (count > 0) begin
            case (P[1:0])
                2'b01: P[2*N:N] <= P[2*N:N] + A;
                2'b10: P[2*N:N] <= P[2*N:N] + S;
            endcase
            P <= $signed(P) >>> 1;
            count <= count - 1;

            if (count == 1) begin
                product <= P[2*N-1:0];
                done <= 1;
            end
        end
    end
endmodule
