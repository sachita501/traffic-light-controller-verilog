# Traffic Light Controller using Verilog

## Overview
This project implements a Traffic Light Controller using Verilog HDL. The controller manages North-South and East-West traffic signals using a Finite State Machine (FSM). An emergency input is included to prioritize the North-South road.

## Features
- Finite State Machine based design
- North-South and East-West traffic control
- Green and Yellow light sequencing
- Emergency mode support
- Behavioral simulation using Vivado

## Tools Used
- Verilog HDL
- Xilinx Vivado
- Draw.io

## Project Files
- traffic_light_controller.v
- traffic_light_controller_tb.v
- block_diagram.drawio.png
- state_diagram.png

## State Sequence
NS Green → NS Yellow → EW Green → EW Yellow → NS Green

Emergency Mode:
Emergency = 1 → North-South Green

## Simulation
The project was verified using a Verilog testbench in Vivado Behavioral Simulation.

## Author
Sachita Reddy
