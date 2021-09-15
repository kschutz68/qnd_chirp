%% create DUT 
H = tf([1 0 (2*pi*1e3)^2],[1 2*pi*1e3 (2*pi*1e3)^2])
% set testbench parameters
BW = 10e3; % single-sided bandwidth
OSR = 2.56; % oversampling ratio
Fs = OSR*BW; % sample rate
Tsweep = 1; % length of chirp in seconds
L = Tsweep*Fs; % length of chirp in samples
% No averaging, no windowing, no leakage

%% view analytical response
w = linspace(0,2*pi*BW,L/OSR+1);
[mag,phz,wout] = bode(H,w);
figure;subplot(211);plot(w/(2*pi),20*log10(squeeze(mag)));grid
title('Magnitude Response');xlabel('Hz');ylabel('dB');
set(gca,'Ylim',[-50 10]);
subplot(212);plot(w/(2*pi),squeeze(phz));grid
title('Phase Response');xlabel('Hz');ylabel('degrees');



