clear all
close all
clc


% 1 - chargement de fichier dans MATLAB
[x,fs] = audioread('achraf.mp3');
t = 0:1/fs:length(x)/fs-1/fs;

% 2 - Traçage du signal 
subplot(5,1,1)
plot(t,x);
title('Signal Originale')
xlabel('Temps (s)');
ylabel('Amplitude');

%3 - 
fs_double = 2*fs; % fréquence d'échantillonnage double
fs_half = fs/2; % fréquence d'échantillonnage deux fois plus petite
sound(x,fs_double); % pour une version plus aiguë
sound(x,fs_half); % pour une version plus grave



% Segmentation de la phrase Et Traçage du signal en fonction des indices du vecteur x
subplot(5,1,2)
riennesertde = x(1:200000);
plot(t(1:200000),riennesertde)
title('Rien ne sert de ')
xlabel('Temps (s)');
ylabel('Amplitude');
subplot(5,1,3)
courir = x(200000:250000);
plot(t(200000:250000),courir)
title('courir ')
xlabel('Temps (s)');
ylabel('Amplitude');
subplot(5,1,4)
ilfaut = x(250000:320000);
plot(t(250000:320000),ilfaut)
title('il faut')
xlabel('Temps (s)');
ylabel('Amplitude');
subplot(5,1,5)
partirapoint = x(320000:480000);
plot(t(320000:480000),partirapoint)
title('partir a point')
xlabel('Temps (s)');
ylabel('Amplitude');

% Synthèse d’une nouvelle phrase , on utilise la fonction 'sound' pour
% ecouter la phrase Synthèse
synthese_phrase = [riennesertde ; partirapoint ; ilfaut ; courir];
sound(synthese_phrase, fs);
figure;
subplot(2,1,1)
plot(t(1:480003),synthese_phrase)
title('Synthèse d’une nouvelle phrase')
xlabel('Temps (s)');
ylabel('Amplitude');

subplot(2,1,2)
plot(t,x);
title('Signal Originale')
xlabel('Temps (s)');
ylabel('Amplitude');



