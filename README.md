This project implements a Finite Impulse Response (FIR) Filter using Verilog HDL. The design includes a parameterized FIR filter module with configurable taps, input width, coefficient width, and output width. A complete testbench is provided along with simulation results using ModelSim.


PROJECT OVERVIEW:

A FIR filter is a fundamental digital filter used in DSP applications such as audio processing, communication systems, biomedical signal processing, and image enhancement.

This design uses:

1.Shift-register based architecture

2.Multiply–Accumulate (MAC) operation

3.User-defined coefficients

4.Synthesizable Verilog code

5.Testbench for simulation and waveform verification



 FEATURES:

1.Parameterized number of taps (default: 8)

2.Signed input and coefficients

3.Clean and synthesizable Verilog code

4.Testbench included for verification

5.Waveforms and output data verified on ModelSim

6.Easy to modify for any DSP application



FILE INCLUDED:

1.File Name	Description

2.fir_filter.v	Main FIR filter RTL implementation

3.fir_filter_tb.v	Testbench for simulation

4.Simulation screenshots

5.README.md	Project documentation


How the FIR Filter Works:

The FIR filter performs:

y[n] = \sum_{k=0}^{N-1} h[k] \cdot x[n-k]

Where:
x[n] – input sample

h[k] – filter coefficient

y[n] – output sample

N – number of taps

		
SIMULATION PROCEDURE (ModelSim):
 
1. Load project into ModelSim
   
2. Compile RTL
   
3. Compile testbench
4. Run simulation:
 
	vsim work.fir_filter_tb
		run 200 ns

5. Observe the output y in waveform viewer


SAMPLE OUTPUT:

Input sequence: 0, 5, 10, 15, 20, 15, 10, 5, 0

Output: Filtered waveform showing weighted sum effect

The FIR output is correctly smoothed based on coefficients


APPLICATIONS:

1.Audio Filtering

2.Noise Reduction

3.Signal Smoothing

4.Biomedical ECG/EEG signal processing

5.Communication channel filtering


CONTRIBUTING:

Feel free to fork the project and submit improvements. Coefficients and tap values can be easily customized.

