clc
clear

%Set parameters

m = 0.068;      % Mass of ball
g = 9.81;       % Gravity 
x0 = 0.009;     % Equilibrium position 
L0 = 0.02;      % Inductance parameter
L1 = 0.0001;    % Coil inductance 
R = 1;          % Coil resistance 

%calculate the equilibrium point

C  = (L0 * x0) / 2; %magnetic force const
i0 = sqrt((m * g * x0^2) / C); %Equilibrium Current 

%system coefficient

K1    = 2 * C * (i0 / x0^2);
Kx    = 2 * C * (i0^2 / x0^3);
K2    = Kx / m;
p3    = R / L1;
K_emf = K1 / L1;

%State space model

A = [0      1       0;
     K2     0      -K1/m;
     0     -K_emf  -p3];

B     = [0; 0; 1/L1];

C_mat = [1 0 0];

D     = 0;

sys_ss = ss(A, B, C_mat, D);

%transfer Function

sys_tf = tf(sys_ss);

%display Model

disp('State Space Model');
disp(sys_ss);
disp('Transfer Function');
disp(sys_tf);

%Poles Stability Check

disp('Poles');
disp(pole(sys_tf));

%open loop step response

figure(1);
step(sys_tf, 0.01);
title('Open Loop Step Response of MLS');
xlabel('Time');
ylabel('Position');
grid on;

%Root Locus

figure(2);
rlocus(sys_tf);
title('Root Locus - Open Loop MLS');
grid on;

%Bode Diagram

figure(3);
bode(sys_tf);
title('Bode Diagram - Open Loop MLS');
grid on;

C_pid = pidtune(sys_tf, 'PID');

disp('PID Controller');
disp(C_pid);

% Closed Loop System 
sys_cl_pid = feedback(C_pid * sys_tf, 1);

%Step Response (Without Noise) 
figure(4);
step(sys_cl_pid);
title('Closed Loop Step Response - PID Controller');
xlabel('Time');
ylabel('Position ');
grid on;

%Performance Check 
info = stepinfo(sys_cl_pid);
disp('PID Performance ');
disp(['Rise Time    : ', num2str(info.RiseTime), ' s']);
disp(['Settling Time: ', num2str(info.SettlingTime), ' s']);
disp(['Overshoot    : ', num2str(info.Overshoot), ' %']);



