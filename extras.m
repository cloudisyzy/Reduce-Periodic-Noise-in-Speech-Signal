% clear; clc; close all
addpath('utils\'); addpath('functions\')
[y,fs]=audioread('data/EQ2401Project2data2024.wav');
disp('Now executing other LMS-related algorthims')
fprintf('Sequential order of what you hear:')

%% LMS
N_lms = 200;
delay_lms = 32;
step_lms = 0.02;
[thetahatlms, xhatlms, yhatlms] = lms(y, N_lms, step_lms, delay_lms); 

%% LeakyLMS
N_lmsleaky = 200;
delay_lmsleaky = 32;
step_lmsleaky = 0.02;
gamma_lmsleaky = 0.02;
[thetahatlmsleaky, xhatlmsleaky, yhatlmsleaky] = lmsLeaky(y, N_lmsleaky, ...
    step_lmsleaky, delay_lmsleaky, gamma_lmsleaky); 

%% Sign Algorithms 
% Sign Error
N_signError = 200;
delay_signError = 32;
step_signError = 4e-4;
[thetahatsignError, xhatsignError, yhatsignError] = lmsSign(y, N_signError, ...
    step_signError, delay_signError, 1); 
% Sign Regressor
N_signRegressor = 200;
delay_signRegressor = 32;
step_signRegressor = 4e-4;
[thetahatsignRegressor, xhatsignRegressor, yhatsignRegressor] = lmsSign(y, ...
    N_signRegressor, step_signRegressor, delay_signRegressor, 2); 
% Sign Sign
N_signSign = 200;
delay_signSign = 32;
step_signSign = 1e-4;
[thetahatsignSign, xhatsignSign, yhatsignSign] = lmsSign(y, N_signSign, ...
    step_signSign, delay_signSign, 3); 

%% LMS Volterra
N_lmsVolterra = 200;
delay_lmsVolterra = 32;
step_lmsVolterra = 0.008;
[thetahatlmsVolterra, xhatlmsVolterra, yhatlmsVolterra] = lmsSinVolterra(y, ...
    N_lmsVolterra, step_lmsVolterra, delay_lmsVolterra);

%% Momentum LMS
N_lmsMomentum = 200;
delay_lmsMomentum = 32;
step_lmsMomentum = 0.02;
gamma_lmsMomentum = 0.02;
[thetahatlmsMomentum, xhatlmsMomentum, yhatlmsMomentum] = lmsMomentum(y, ...
    N_lmsMomentum, step_lmsMomentum, delay_lmsMomentum, gamma_lmsMomentum);

%% Play Sound
delta_t = length(y)/fs + 0.5;
fprintf('\n1. LMS (as a reference)')
soundsc(xhatlms, fs)
pause(delta_t)
fprintf('\n2. Leaky LMS')
soundsc(xhatlmsleaky, fs)
pause(delta_t)
fprintf('\n3. Sign Error')
soundsc(xhatsignError, fs)
pause(delta_t)
fprintf('\n4. Sign Regressor')
soundsc(xhatsignRegressor, fs)
pause(delta_t)
fprintf('\n5. Sign Sign')
soundsc(xhatsignSign, fs)
pause(delta_t)
fprintf('\n6. LMS Volterra')
soundsc(xhatlmsVolterra, fs)
pause(delta_t)
fprintf('\n7. Momentum LMS\n')
soundsc(xhatlmsMomentum, fs)

%% Save Audio Files
% audiowrite('results\LMS_Leaky.wav', xhatlmsleaky, fs);
% audiowrite('results\SignError.wav', xhatsignError, fs);
% audiowrite('results\SignRegressor.wav', xhatsignRegressor, fs);
% audiowrite('results\SignSign.wav', xhatsignSign, fs);
% audiowrite('results\LMS_Volterra.wav', xhatlmsVolterra, fs);
% audiowrite('results\LMS_Momentum.wav', xhatlmsMomentum, fs);
