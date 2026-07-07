`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Project Name : FPGA Based Traffic Light Controller with Emergency Priority
// Engineer     : Sachita Reddy
// Description  :
// This project implements a Finite State Machine (FSM) based traffic light
// controller using Verilog HDL. The controller manages North-South and
// East-West traffic signals while providing priority to emergency vehicles.
//
// Features:
// - FSM based control
// - Emergency vehicle priority
// - Clock driven state transitions
// - Behavioral simulation in Vivado
//
// Tool Used : AMD Vivado 2026.1
// Language  : Verilog HDL
//////////////////////////////////////////////////////////////////////////////////
module traffic_light_controller(
    input clk,
    input reset,
    input emergency,

    output reg ns_red,
    output reg ns_yellow,
    output reg ns_green,

    output reg ew_red,
    output reg ew_yellow,
    output reg ew_green
);

reg [1:0] state;
reg [3:0] timer;

// Traffic light states
parameter NS_GREEN  = 2'd0; // North-South Green
parameter NS_YELLOW = 2'd1; // North-South Yellow
parameter EW_GREEN  = 2'd2; // East-West Green
parameter EW_YELLOW = 2'd3; // East-West Yellow

// State transition logic
always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        state <= NS_GREEN;
        timer <= 0;
    end
    else if(emergency)
    begin
        state <= NS_GREEN;
        timer <= 0;
    end
    else
    begin
        if(timer == 4)
        begin
            timer <= 0;

            case(state)
                NS_GREEN  : state <= NS_YELLOW;
                NS_YELLOW : state <= EW_GREEN;
                EW_GREEN  : state <= EW_YELLOW;
                EW_YELLOW : state <= NS_GREEN;
            endcase
        end
        else
            timer <= timer + 1;
    end
end

// Output logic for traffic lights
always @(*)
begin
    ns_red = 0;
    ns_yellow = 0;
    ns_green = 0;
    ew_red = 0;
    ew_yellow = 0;
    ew_green = 0;

    case(state)
    
       // North-South Green, East-West Red
        NS_GREEN:
        begin
            ns_green = 1;
            ew_red = 1;
        end
        
        // East-West Green, North-South Red
        NS_YELLOW:
        begin
            ns_yellow = 1;
            ew_red = 1;
        end
   
        // East-West Green, North-South Red
        EW_GREEN:
        begin
            ew_green = 1;
            ns_red = 1;
        end

        // East-West Yellow, North-South Red
        EW_YELLOW:
        begin
            ew_yellow = 1;
            ns_red = 1;
        end

    endcase
end

endmodule
