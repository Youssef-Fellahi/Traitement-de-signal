clear all
close all
clc 

f1 = 500;  
f2 = 400;  
f3 = 50;   
Te = 0.0005;  
fe = 1/Te;


t = linspace(0,5,5/Te);
N = length(t);
x = sin(2*pi*f1*t) + sin(2*pi*f2*t) + sin(2*pi*f3*t);



% 1. Calcul de la transformée de Fourier du signal d'entrée
X = fft(x);

% 2. Tracé du signal d'entrée et de sa transformée de Fourier
figure
subplot(2,1,1)
plot(t, x)
xlabel('Temps (s)')
ylabel('Amplitude')
title('Signal d''entrée x(t)')

f = (0:N-1)*(fe/N);
subplot(2,1,2)
plot(f,abs(X))
xlabel('Fréquence (Hz)')
ylabel('Amplitude')
title('Transformée de Fourier du signal d''entrée X(f)')

% Avec plus d'échantillons, on peut mieux détecter les composantes fréquentielles d'un signal,
% c'est-à-dire qu'avec 0.0001 on peut mieux détecter qu'avec 0.0005.


% 1. Tracer le module de la fonction H(f)
K = 1;
wc = 50;


w = (2*pi).*f;
H = (K*1i*w/wc) ./ (1 + 1i*w/wc);

H_mod = abs(H);
plot(f,H_mod);
xlabel('Pulsation (rad/s)');
ylabel('Module de H(f)');
title('Diagramme de Bode du filtre passe haut de premier ordre');

% 2) on aura un perte d'information plus petit si on utilise petit valeur
% de wc

wc = [10, 20, 50, 100, 200]; % différentes pulsations de coupure
H = zeros(length(wc),length(f)); % Initialisation de la matrice H
for i=1:length(wc)
   H(i,:) = (1i*w/wc(i)) ./ (1 + 1i*w/wc(i)); % fonction H(f) pour chaque pulsation de coupure
end
figure;
semilogx(f,20*log10(abs(H))) % tracé de 20.log(|H(f)|) pour chaque pulsation de coupure
xlabel('Fréquence (Hz)'); ylabel('Atténuation (dB)');
legend(strcat('wc = ',num2str(wc')));

