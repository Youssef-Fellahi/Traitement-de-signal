clear all
close all
clc

fe=10000; %fréquence d'échantillonnage
te=1/fe; %période d'échantillonnage
N=5000; %nombre d'échantillons
t=0:te:(N-1)*te; %vecteur temps

%génération du signal d'origine X
X = 1.2*cos(2*pi*440*t + 1.2)+ 3*cos(2*pi*550*t) + 0.6*cos(2*pi*2500*t);

% 1- Tracer le signal X
subplot(4,1,1)
plot(t,X)
xlabel("Temps (s)")
ylabel("Signal original")
title("Signal Original")

%  2- Calculer la TFD du signal X en utilisant la commande fft, puis tracer son spectre
% en amplitude après avoir créé le vecteur f qui correspond à l'échantillonnage du signal
% dans l'espace fréquentiel. 
f=(0:N-1)*(fe/N);
y=fft(X);
subplot(5,1,2)
plot(f,2*(abs(y)/N));
xlabel("Fréquence (Hz)")
ylabel("Amplitude")
title("Spectre d'amplitude du signal original")

% 3. Pour mieux visualiser le contenu fréquentiel du signal, utiliser la fonction fftshift, qui
% effectue un décalage circulaire centré sur zéro du spectre en amplitude obtenu par la
% commande fft.
z=fftshift(abs(y));
subplot(5,1,3)
fc=(-N/2:N/2-1)*(fe/N);
plot(fc,z)
xlabel("Fréquence (Hz)")
ylabel("Amplitude")
title("Spectre d'amplitude du signal original (centré)")

% 4- Créer un nouveau signal xnoise, en introduisant un bruit blanc gaussien dans le
% signal d’origine X, puis visualisez-le. 

% génération du bruit
xnoise = X+randn(size(X));
ynoise = fft(xnoise);
r1=2*(abs(ynoise)/N);
subplot(5,1,4)
plot(f,r1)
xlabel("Fréquence (Hz)")
ylabel("Amplitude")
title("Spectre d'amplitude du signal bruite")

% 6- Calculez puis tracer le spectre de puissance du signal bruité centré à la fréquence
% zéro.
z1=fftshift(r1);
p = (z1.^2)/N;
subplot(5,1,5)
plot(fc,p)
xlabel("Fréquence (Hz)")
ylabel("Puissance")
title("Spectre de puissance du signal bruite (centré)")

% 7- Augmenter l’intensité de bruit puis afficher le spectre. Interpréter le résultat obtenu.
% On peut augmenter l'intensité de bruit en multipliant la fonction randn par un scalaire
