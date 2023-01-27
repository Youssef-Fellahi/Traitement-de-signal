clear all 
close all 
clc
% Definition des variables et de signal

te = 0.0001 ;
fe = 1/te ;
t = 0:te:5-te ;
N = length(t);
f = (0:N-1)*(fe/N);
fshift = (-N/2:N/2-1)*(fe/N);


% Definition de la fonction xt
xt = sin(2*pi*500*t)+ sin(2*pi*400*t)+ sin(2*pi* 50*t) ;
tansf = fft(xt);


% la fonction de transmmitance
fc1 = 500 ; 
fc2 = 400 ;
fc3 = 50;

K = 1 ; 
H1 = (K*1j*f/fc1)./(1+1j*f/fc1) ;
H2 = (K*1j*f/fc2)./(1+1j*f/fc2) ; 
H3 =(K*1j*f/fc3)./(1+1j*f/fc3) ;


G1 = 20*log(abs(H1));
G2 = 20*log(abs(H2));
G3 = 20*log(abs(H3));

%
yt1 = tansf.*H1;
inver1=ifft(yt1,'symmetric');

yt2 = tansf.*H2;
inver2=ifft(yt2,'symmetric');

yt3 = tansf.*H3;
inver3 = ifft(yt3,'symmetric');

%la représentation du signal dans le domaine fréquenciel aprés le fitrage 
 subplot(131)
 plot(fshift,fftshift(abs(fft(inver1))/N)*2);
 title(' le signal filtré avec fc=500')

 subplot(132)
 plot(fshift,fftshift(abs(fft(inver2))/N)*2);
title(' le signal filtré avec fc=400')

 subplot(133)
 plot(fshift,fftshift(abs(fft(inver3))/N)*2);
title(' le signal filtré avec fc=50')

 
% Aprés cette présentation on peut dire que la fréquence fc=50 est la plus
% optimal ; car on a diménué  la composante à 50 hz sans perdre beaucoup
% d'information Util

% 4 . la valeur plus optimal de fc est 50 Hz
% 5. Observez le signal y(t)

figure;
plot(fshift,fftshift(abs(fft(inver3))/N)*2)
title('le signal y(t) obtenu')



