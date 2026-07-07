`timescale 1ns / 1ps

module traffic_light_controller_tb;

reg clk;
reg reset;
reg emergency;

wire ns_red;
wire ns_yellow;
wire ns_green;

wire ew_red;
wire ew_yellow;
wire ew_green;

traffic_light_controller uut(
    .clk(clk),
    .reset(reset),
    .emergency(emergency),
    .ns_red(ns_red),
    .ns_yellow(ns_yellow),
    .ns_green(ns_green),
    .ew_red(ew_red),
    .ew_yellow(ew_yellow),
    .ew_green(ew_green)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    reset = 1;
    emergency = 0;

    // Reset
    #10 reset = 0;

    // Let the controller cycle normally
    #120;

    // Emergency vehicle arrives
    emergency = 1;

    #40;

    // Emergency clears
    emergency = 0;

    // Run again
    #120;

    $finish;
end

endmodule
