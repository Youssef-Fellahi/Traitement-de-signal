clear all
close all
clc




[music, fs] = audioread('test.wav');
%save('testt.mat', 'y', 'fs');
%load('testt.mat');
music = music';
N=length(music);
te = 1/fs;% fs=fe
t = (0:N-1)*te;

f = (0:N-1)*(fs/N);
fshift = (-N/2:N/2-1)*(fs/N);

y_trans = fft(music);
% subplot(3,1,1)
% plot(t,y)
% subplot(3,1,2)
 plot(fshift,fftshift(abs(y_trans)))


% % % % % % % % % % % % % % % % % % % % % % % % % % % 

k = 1;
fc = 5000;
%la transmitance complexe 
h =k./(1+1j*(f/fc).^1000);
h_filter = [h(1:floor(N/2)), flip(h(1:floor(N/2)))];

semilogx(f(1:floor(N/2)),abs( h(1:floor(N/2))),'linewidth',1.5)

% %diagramme de bode en fct de la phase 
% P = angle(h);
% P1 = angle(H1);
% P2 = angle(H2);

y_filtr = y_trans(1:end-1).*h_filter;
sig_filtred= ifft(y_filtr,"symmetric");

plot(fshift(1:end-1),fftshift(abs(fft(sig_filtred))))