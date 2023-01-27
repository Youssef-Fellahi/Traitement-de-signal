clear all
close all
clc

% 1-Chargement des données audio à partir du fichier
[y,Fs] = audioread('bluewhale.au');

% Sélection des données correspondant au chant du rorqual bleu
chant = y(2.45e4:3.10e4);

% 2- Écoute du signal
sound(chant, Fs);

% Visualisation du signal
figure;
plot(chant);
title('Signal de chant de rorqual bleu');

% Spécification d'une nouvelle longueur de signal qui est une puissance de 2
N = 2^nextpow2(length(chant));

% 3- Calcul de la transformée de Fourier et de la densité spectrale de puissance
chant_fft = fft(chant, N);
chant_fft = chant_fft(1:N/2+1);
chant_fft_power = abs(chant_fft).^2/N;

% Tracé de la densité spectrale de puissance
figure;
plot(0:Fs/N:Fs/2,chant_fft_power);
title('Densité spectrale de puissance du chant de rorqual bleu');
