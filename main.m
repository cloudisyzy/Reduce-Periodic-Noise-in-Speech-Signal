clear; clc; close all; addpath('utils\');[y,fs]=audioread('data/EQ2401Project2data2024.wav');

%% LMS

N_lms = 200;
delay_lms = 32;
step_lms = 0.02;
tic;
[thetahatlms, xhatlms, yhatlms] = lms(y, N_lms, step_lms, delay_lms); 
t_lms = toc; 
disp(['Execution time of LMS = ', num2str(t_lms), ' second(s)']);

%% NLMS

N_nlms = 200;
delay_nlms = 32;
step_nlms = 0.1;
c = 1;
tic;
[thetahatnlms, xhatnlms, yhatnlms] = nlms(y, N_lms, step_nlms, c, delay_nlms);
t_nlms = toc; 
disp(['Execution time of NLMS = ', num2str(t_nlms), ' second(s)']);
% [thetahat2nlms, xhat2nlms, yhatn2lms] = nlms(xhatnlms, N_lms, step_nlms, c, delay_nlms);

%% RLS

N_rls = 200;
delay_rls = 32;
lambda_rls = 0.99999;
tic;
[thetahatnrls, xhatrls, yhatrls] = rls(y, N_rls, lambda_rls, delay_rls);
t_rls = toc; 
disp(['Execution time of RLS = ', num2str(t_rls), ' second(s)']);


% hp = fir1(128,[0.2 1-1e-6],hamming(129));
% xhatlms_hp = conv(hp,xhatlms);

%% Plots

plotComp(y, xhatlms, xhatnlms, xhatrls, yhatlms, yhatnlms, yhatrls)
dynamicWeightPlot(thetahatlms, thetahatnlms, thetahatnrls, 1:500)
dynamicWeightPlot(thetahatlms, thetahatnlms, thetahatnrls, 11900:12300)

%% Play Sound, the order of sound: Original, LMS, NLMS, RLS

delta_t = length(y)/fs + 0.5;
soundsc(y, fs)
pause(delta_t)
soundsc(xhatlms, fs)
pause(delta_t)
soundsc(xhatnlms, fs)
% % pause(delta_t)
% % soundsc(xhat2nlms, fs)
pause(delta_t)
soundsc(xhatrls, fs)

%% Save Audio Files

% audiowrite(sprintf('results/LMS_%d_%d_%.2f.wav',N_lms,delay_lms,step_lms), xhatlms, fs);
% audiowrite(sprintf('results/NLMS_%d_%d_%.1f_%.2f.wav.wav',N_nlms,delay_nlms,c,step_nlms), xhatnlms, fs);
% audiowrite(sprintf('results/RLS_%d_%d_%.6f.wav.wav',N_rls,delay_rls,lambda_rls), xhatrls, fs);
% % audiowrite('results\EQ2401project1data2024.wav', y, fs);