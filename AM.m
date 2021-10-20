%Develop a model of a conventional AM system using simulink and MATLAB.The 
%message signal is 1.5Hz sine wave and the carrier frequency is selected as
%20Hz.The sample time parameter value of 1/1000 is used.The choice of 
%modulation index is made by setting the gain value in the gain block.For 
%this experiment,ma = 0.5 has been selected.The parameters of simulation 
%including message signal frequency,carrier frequency,modulation depth,and 
%sampling rate are set up by a computation MATLAB m-file.The m-file also 
%computes transfer functions of the BP and LP filters in the AM demodulator
%using an envelope detector. 

fm=input('Enter friquency of message signal ');
fc=input('Enter friquency of carrier signal ');
Am=input('Enter Amplitude of message signal ');
Ac=input('Enter Amplitude of carrier signal ');
fs=input('Enter Sammpling period ');
t=0:1/fs:1;        % Time Period

% MESSAGE SIGNAL 
Em=Am.*sin(2.*pi.*fm.*t);     % MESSAGE SIGNAL  
subplot(411);
plot(t,Em)
xlabel('Time');  
ylabel('Amplitude');
title('Message Signal');

% CARRIER SIGNAL
Ec=Ac.*sin(2.*pi.*fc.*t);     % CARRIER SIGNAL
subplot(412);
plot(t,Ec)
xlabel('Time');  
ylabel('Amplitude');
title('Carrier Signal');


% AM MODULATION
m=Am/Ac;      % MODULATION INDEX
s=Ac.*(1+(m.*Am.*sin(2*pi*fm*t))).*sin(2*pi*fc*t);      % AM MODULATED SIGNAL
subplot(413);
plot(t,s)
xlabel('Time');  
ylabel('Amplitude');
title('AM Modulated Signal');

% AM DEMODULATION
up=envelope(s,300);    % AM DEMODULATED SIGNAL
subplot(414);
plot(t,up)
xlabel('Time');  
ylabel('Amplitude');
title('AM Dimodulated Signal (Envelope Detector)');
%grid on