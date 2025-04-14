# 16-bit-LFSR-Noise_Generator

# Noise Generator using LFSR in Verilog
This module generates pseudo-random noise using a Linear Feedback Shift Register (LFSR) and adds it to a clean 8-bit input signal. 
It's designed to simulate noise in signal processing systems such as FIR filters.

---

# Module: Noise_Generator.v

# Inputs:
- clk : Clock signal.
- rst : Asynchronous reset.
- clear_data [7:0] : The original clean input signal.

# Output:
- noisy_signal [7:0] (signed) : The output signal with added noise.

---

# Parameters:
- WIDTH = 16 : Sets the width of the LFSR register (default is 16 bits).

---

# How It Works:

- The LFSR generates pseudo-random bits using XOR taps at bits [15, 13, 12, 10] based on a primitive polynomial.
- A subset of the LFSR output bits (`[11:8]`) is extracted and **centered around zero** using:
  verilog
  wire signed [3:0] noise = $signed(LFSR_Data[11:8]) - 4'sd8;
