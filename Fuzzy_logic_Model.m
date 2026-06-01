%Fuzzy logic controller design for MLS

%fuzzyLogicDesigner

run('Assingment_Model_.m');



Kp = C_pid.Kp;
Ki = C_pid.Ki;
Kd = C_pid.Kd;

Gain_e  = 1;
Gain_de = Kd/Kp;  
Gain_u  = Kp;      

fis_MLS = readfis('Membership_Function_Rule_');
disp('FIS Loaded Successfully!');


