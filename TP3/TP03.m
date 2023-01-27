clear all 
close all 
clc


load('ecg.mat')
Fe=500;
Te=1/Fe;
N=length(ecg);
t = 0:Te:(N-1)*Te;
subplot(3,2,1)
plot(t,ecg)
grid on
title(" représentation graphique de l’activation électrique du cœur")
xlabel("t")
ylabel("ECG")
xlim([0.5 1.5]);

%%
f=(0:N-1)*(Fe/N);
fshift=(-N/2:N/2-1)*(Fe/N);
y = fft(ecg);
subplot(3,2,2)
plot(f,fftshift(abs(y)));
grid on
title(" représentation graphique de la transformée de fourier du signal ECG")
xlabel("f")
ylabel("Tfd")
%%
% conception du filtre
pass_haut=ones(size(ecg));
fc=0.5;
index_fc= ceil((fc*N)/Fe);
pass_haut(1:index_fc)= 0;
pass_haut(N-index_fc+1:N) = 0;
subplot(3,2,3)
plot(f,pass_haut,"linewidth",1.5)
%% Filtrage

ecg1_freq = pass_haut.*y; 
ecg1 = ifft(ecg1_freq,"symmetric");

%% plot filterd signal 

plot(t,ecg1)
hold on
plot(t,ecg+3)
hold on 
plot(t,ecg-ecg1+1.5)

%% Filtrage fréquence 50%

pass_notch=ones(size(ecg));
fc2=50;
index_fc2= ceil((fc2*N)/Fe)+1;
pass_notch(index_fc2)= 0;
pass_notch(N-index_fc2+1) = 0;

%% Filtrage 2 

ecg2_freq = pass_notch.*fft(ecg1); 
ecg2 = ifft(ecg2_freq,"symmetric");

subplot(211)
plot(t,ecg)
subplot(212)
plot(t,ecg-ecg2)


%% Filtrage pass_bas 

pass_bas=zeros(size(ecg));
fc3 = 10;
index_fc3 = ceil((fc3*N)/Fe);
pass_bas(1:index_fc3)= 1;
pass_bas(N-index_fc3+1:N) = 1;


%% Filtrage 2 

ecg3_freq = pass_bas.*fft(ecg2); 
ecg3 = ifft(ecg3_freq,"symmetric");

subplot(313)
plot(t,ecg3)
subplot(311)
plot(t,ecg)
subplot(312)
plot(t,ecg2)

plot(t,ecg-ecg3)


[c,lags] = xcorr(ecg3,ecg3);
stem(lags/Fe,c)


