
 // FIR Filter - N-tap
// Low-pass example

module fir_filter #
(
    parameter N = 21,               // Number of taps
    parameter WIDTH = 16             // Input/output bit width
)
(
    input clk,
    input rst,
    input signed [WIDTH-1:0] x_in,  // Input sample
    output reg signed [WIDTH-1:0] y_out // Filtered output
);

    // Load coefficients (from MATLAB, fixed point)
    reg signed [WIDTH-1:0] h [0:N-1];

    initial begin
        $readmemb("fir_coeffs.txt", h); // Load coefficients from file
    end

    reg signed [WIDTH-1:0] x_reg [0:N-1]; // Shift register

    integer i;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            y_out <= 0;
            for (i=0; i<N; i=i+1)
                x_reg[i] <= 0;
        end else begin
            // Shift input samples
            for (i=N-1; i>0; i=i-1)
                x_reg[i] <= x_reg[i-1];
            x_reg[0] <= x_in;

            // FIR calculation
            y_out <= 0;
            for (i=0; i<N; i=i+1)
                y_out <= y_out + (x_reg[i] * h[i]) >>> 15; // simple fixed-point scaling
        end
    end

endmodule

