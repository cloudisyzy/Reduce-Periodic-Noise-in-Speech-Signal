clear; clc; close all; addpath('utils\');[y,fs]=audioread('EQ2401Project2data2024.wav');

N_lms = 200;
delay_lms = 40;
step_lms = 0.02;
[thetahatlms, xhatlms, noiselms] = lms(y, N_lms, step_lms, delay_lms);

% figure;
% [~,~] = spectraEstimation(y,'half',1);
% title('Noisy Speech')
% figure;
% [~,~] = spectraEstimation(xhatlms,'half',1);
% title('Clean Speech')
% figure;
% [~,~] = spectraEstimation(noiselms,'half',1);
% title('Noise')


N_nlms = 200;
delay_nlms = 40;
step_nlms = 0.1;
c = 1;
[thetahatnlms, xhatnlms, noisenlms] = nlms(y, N_lms, step_nlms, c, delay_nlms);
% [thetahat2nlms, xhat2nlms, noisen2lms] = nlms(xhatnlms, N_lms, step_nlms, c, delay_nlms);

% figure;
% [~,~] = spectraEstimation(y,'half',1);
% title('Noisy Speech')
% figure;
% [~,~] = spectraEstimation(xhatlms,'half',1);
% title('Clean Speech')
% figure;
% [~,~] = spectraEstimation(noisenlms,'half',1);
% title('Noise')

N_rls = 200;
delay_rls = 40;
lambda_rls = 0.9999;
[thetahatnrls, xhatrls, noisenrls] = rls(y,N_rls,lambda_rls,delay_rls);


% hp = fir1(128,[0.2 1-1e-6],hamming(129));
% xhatlms_hp = conv(hp,xhatlms);


delta_t = length(y)/fs + 0.5;
soundsc(y, fs)
pause(delta_t)
soundsc(xhatlms, fs)
pause(delta_t)
soundsc(xhatnlms, fs)
pause(delta_t)
soundsc(xhat2nlms, fs)
pause(delta_t)
soundsc(xhatrls, fs)