clear; clc; close all; addpath('utils\');[y,fs]=audioread('data/EQ2401Project2data2024.wav');

figure;
plot(1:length(y),y)

figure;
[~,~] = spectraEstimation(y,'full',1);

figure;
% [Y,f] = periodogram(y, hamming(length(y)), [], fs);
[Y,f] = periodogram(y, [], [], fs);
Y = 10*log10(Y);
plot(f,Y)
% soundsc(y,fs)