clear; addpath('utils\');

[y,fs]=audioread('EQ2401Project2data2024.wav');

N_lms = 200;
delay_lms = 50;
num_iteration_lms = 1;
step_lms_list = linspace(0.02,0.02,num_iteration_lms);
xhatlms = lmsLoop(y,N_lms,step_lms_list,delay_lms,num_iteration_lms);

N_nlms = 200;
delay_nlms = 50;
num_iteration_nlms = 5;
step_nlms_list = linspace(0.02,0.02,num_iteration_nlms);
c = 1;
xhatnlms = nlmsLoop(y,N_nlms,step_nlms_list,c,delay_nlms,num_iteration_nlms);


soundsc(xhatnlms,fs)