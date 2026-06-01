🧲 Magnetic Levitation System: PID vs. Fuzzy Logic Controller
📌 Project Overview

The Magnetic Levitation System (MLS) is an inherently unstable and nonlinear control system, making it a challenging benchmark for controller design. This project focuses on modeling, simulating, and comparing two different control approaches in MATLAB/Simulink:

Classical PID Controller
49-Rule Mamdani Fuzzy Logic Controller (FLC)

Both controllers were evaluated under ideal operating conditions and in the presence of external disturbances using Band-Limited White Noise to assess their performance and robustness.

🛠️ Tools & Technologies
Software
MATLAB
Simulink
MATLAB Toolboxes
Control System Toolbox
Fuzzy Logic Toolbox
Control Techniques
State-Space Modeling
Transfer Function Analysis
Rule-Based Intelligent Control
Fuzzy Inference Systems
System Architecture
Fuzzy Logic Controller (49-Rule Mamdani Model) . The controller uses two input variables (Error and Change in Error) and generates the control signal through a 49-rule Mamdani fuzzy inference system.

Performance Comparison :
Performance Metric:
            PID (No Noise)	FLC (No Noise)	PID (With Noise)	FLC (With Noise)
Rise Time	:  1.97 ms	        17.37 ms	        1.97 ms	      17.37 ms
Overshoot	:  15.63%	          3.90%	            ~20%	        5.31%
Steady-State Value :	1.00	  1.039	            ~1.00	        ~1.00
Noise Sensitivity	Low	Low	High Oscillations	Highly Robust

Results and Discussion : The simulation results highlight the strengths and limitations of both controllers:

PID Controller  :
Fast response with a very short rise time.
Achieves nearly zero steady-state error.
More sensitive to external disturbances and measurement noise.
Produces noticeable oscillations when noise is introduced.

Fuzzy Logic Controller (FLC):
Slower rise time compared to PID.
Significantly lower overshoot.
Maintains stable performance under noisy conditions.
Demonstrates strong robustness against external disturbances and system uncertainties.

Conclusion
Although the PID controller provides faster and more precise tracking under ideal conditions, the Fuzzy Logic Controller outperforms PID in terms of robustness, stability, and disturbance rejection. Therefore, the FLC is a more suitable choice for real-world Magnetic Levitation System applications where noise and uncertainties are unavoidable.

How to Run the Simulation:

Clone this repository to your local machine.
Open MATLAB.
Run the Assignment_Model_.m script to initialize the system parameters.
Open either:
Simulink_PID.slx for the PID controller, or
Simulink_FLC.slx for the Fuzzy Logic Controller.
Start the simulation and observe the system response.
Compare the controller performances under both normal and noisy conditions.

 Author
Ali Ahsan Khan
B.Sc. in Mechatronics Engineering
Rajshahi University of Engineering & Technology (RUET)
