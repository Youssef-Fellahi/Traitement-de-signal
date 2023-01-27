clear all
close all
clc


%%%%%%%%%%%%%%%%%%%%%%% Synthèse d’une gamme de musique %%%%%%%%%%%%%%%%%%%%%%%
% Définir les fréquences des notes de la gamme
frequencies = [262 , 294 , 330 , 349 , 392, 440, 494 , 523 ];

% Définir la durée de chaque note en secondes
noteDuration = 1;

% Définir la fréquence d'échantillonnage
fs = 8192;

% Calculer le nombre de points d'échantillonnage pour chaque note
numSamples = fs * noteDuration;

% Initialiser un vecteur pour stocker le signal de la gamme
gamme = [];

% Boucle pour jouer chaque note de la gamme
for i = 1:length(frequencies)
    % Générer un signal sinusoïdal pour chaque note
    t = (0:numSamples-1)/fs;
    note = sin(2*pi*frequencies(i)*t);
    
    % Ajouter le signal de la note au signal de la gamme
    gamme = [gamme, note];
    
    % Jouer la note
    sound(note, fs);
    
    % Attendre une seconde avant de jouer la prochaine note
    pause(noteDuration);
end

% Jouer la gamme complète
sound(gamme, fs);

%%%%%%%%%%%%%%%%%%%%%%% Spectre de la gamme de musique %%%%%%%%%%%%%%%%%%%%%%%
% 2 - signalAnalyzer
N=length(gamme) ;
f=(0:N-1)*(fs/N);
spectre_musique=fft(gamme);
signalAnalyzer(abs(fftshift(spectre_musique)));


% 3 - Tracage de spectrogramme pour visualiser le contenu fréquentiel du signal
spectrogram(gamme,hamming(256),220,512,fs,'yaxis')


%%% Approximation du spectre d’un signal sinusoïdal à temps continu par FFT

% afficher le spectre de fréquence de votre gamme musicale en échelle linéaire
sumfreq =fft(gamme);
fshift = (-N/2:N/2 -1)*fs/N ;
sumfreqshift = fftshift(2*abs(sumfreq)/N);
subplot(2,1,1)
plot(fshift,sumfreqshift)
title("Spectre en echelle lineaire")
xlabel("frequence")
ylabel("Amplitude")

% afficher le spectre de fréquence de votre gamme musicale en échelle en décibels

subplot(2,1,2)
plot(fshift,20*log10(sumfreqshift))
title("Spectre en echelle decibel")
xlabel("frequence")
ylabel("Amplitude")

