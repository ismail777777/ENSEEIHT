clear;
close all;
load('donnees1.mat')
load('donnees2.mat')
fp1 = 0;
fp2 = 46000;
T = 40e-3;
Fe = 120000;
Te = 1/Fe;
Ns = (1/Te)*(T/length(bits_utilisateur1));
Ts = Ns*Te;

% Génération des signaux m1(t) et m2(t)

m1 = kron(2*bits_utilisateur1 - 1, ones(1,Ns));
m2 = kron(2*bits_utilisateur2 - 1, ones(1,Ns));

% Tracé de m1(t) et m2(t)

plot((0:Te:(length(m1)-1)*Te),m1)
xlabel("temps en secondes");
ylabel("Amplitude du signal m1(t)");
title(" figure 1 : signal m1(t)")

figure;
plot((0:Te:(length(m2)-1)*Te),m2)
xlabel("temps en secondes");
ylabel("Amplitude du signal m2(t)");
title(" figure 2 : signal m2(t)")

% Densités spectrales de puissance des signaux m1(t) et m2(t)
 
Sm1 = (1/Ns)*abs(fft(m1)).^2;
Sm2 = (1/Ns)*abs(fft(m2)).^2;

% Tracé des densités spectrales de puissance
figure
plot((0:Fe:(length(fft(m1))-1)*Fe),Sm1);
xlabel("Fréquence en Hz")
ylabel("Sm1(f)")
title(" figure 3 : Densité spectrale de puissance de m1(t)")

figure
plot((0:Fe:(length(fft(m2))-1)*Fe),Sm2);
xlabel(" Fréquence en Hz")
ylabel("Sm2(f)")
title(" figure 4 : Densité spectrale de puissance de m2(t)")

% Géneration d'un signal comportant 5 slots de durée T = 40 ms

signal_m1 = [zeros(1,length(m1)),m1,zeros(1,3*length(m1))];
signal_m2 = [zeros(1,4*length(m2)),m2];
signal = signal_m1 + signal_m2;

% Tracé de ce signal

figure
plot((0:Te:(length(signal)-1)*Te),signal)
xlabel(" temps en secondes")
ylabel("signal résultant")
title('figure 5 : signal résultant')

% Construction du signal MF-TDMA

phi = 2*pi*rand;
x1 = signal_m1;
x2 = signal_m2.*cos(2*pi*fp2*(0:Te:(length(signal)-1)*Te)+phi);
N = randn(1,length(signal));
SNR = 100;
somme = x1 + x2;
Puiss_x = mean(somme.^2);
Puiss_b = Puiss_x*10^(-SNR/10);
signal_MFTDMA = somme + sqrt(Puiss_b)*N;

%Tracé du signal MF-TDMA

figure
plot((0:Te:(length(signal)-1)*Te),signal_MFTDMA)
xlabel(" Temps en secondes")
ylabel("signal MF-TDMA")
title('figure 6 : Tracé du signal MF-TDMA')

% Estimation et tracé de la densité spectrale de puissance du signal MF-TDMA 

S_MF_TDMA = (1/Ns^2)*abs(fft(signal_MFTDMA)).^2;
figure;
plot((-Fe:2*Fe/(length(S_MF_TDMA)-1):Fe),S_MF_TDMA)
xlabel('Fréquence en Hz')
ylabel('Densité spectrale de puissance du signal MF-TDMA')
title(' figure 7 : densité spectrale de puissance du signal MF-TDMA')
 



% Démultiplexage des porteuses

% Synthèse du filtre passe-bas

% Réponse impulsionnelle du filtre passe-bas
N = length(signal_m1);
k = [-N/2 : N/2 - 1]*Te;
h = 2/(Ns*N)*2*fp2*sinc(2*pi*fp2*k);
figure
plot([-N/2 : N/2 - 1],h)
xlabel("temps en secondes")
ylabel('h(t)')
title('figure 8 : réponse impulsionnelle')

% Réponse en fréquence du filtre passe-bas
H = fft(h);
figure;
plot([-N/2 : N/2 - 1]*Fe,abs(fftshift(H)));
xlabel('Fréquence en Hz')
ylabel('réponse en fréquence')
title('figure 9 : La transformé de Fourier de la réponse impulsionnelle')

% Densité spectrale de puissance du signal MF-TDMA reçu et le module de la réponse en fréquences du filtre implanté

figure;
plot(linspace(-Fe/2,Fe/2,length(H)),abs(H))
hold on;
plot(linspace(-Fe/2,Fe/2,length(S_MF_TDMA)),abs(S_MF_TDMA))
xlabel('Fréquence en Hz')
ylabel('réponse en fréquence')
title('figure 10 : Densité spectrale de puissance du signal reçu et la réponse en fréquences du filtre passe-bas')
hold off;

% Synthèse du filtre passe-haut

% Réponse impulsionnelle idéale du filtre passe haut
N2 = length(signal_m2);
dirc = zeros(1,N2);
dirc(N2/2 + 1) = 1;
h_IpH = dirc - h;
H1 = 1 - H;

% Tracé de la réponse impulsionnelle du filtre passe haut

figure
plot(linspace(-N*Te,N*Te,length(h_IpH)),h_IpH)
title(" figure 11 : réponse impulsionnelle idéale du filtre passe haut")
xlabel("temps en secondes")
ylabel("réponse impulsionnelle idéale")

% Tracé de la réponse en fréquence du filtre passe haut

H_IpH = fft(h_IpH);
figure
plot(linspace(-Fe/2,Fe/2,length(H_IpH)),abs(fftshift(H_IpH)))
title(" figure 12 : la réponse en fréquence du filtre passe haut")
xlabel("Fréquence en Hz")
ylabel("Réponse en fréquence")

% Traçage de la densité spectrale de puissance du signal MF-TDMA reçu et du module de la réponse en fréquences du filtre passe haut implanté

figure
plot(linspace(-Fe/2,Fe/2,length(H1)),abs(fftshift(H1)))
hold on;
plot(linspace(-Fe/2,Fe/2,length(S_MF_TDMA)),abs(fftshift(S_MF_TDMA)))
title(" figure 13 : Tracé de la densité spectrale de puissance du signal MF-TDMA et du module de la réponse en fréquences du filtre implanté")
xlabel("fréquence en Hz")
ylabel("Réponse en fréquence")
hold off;

% Filtrage
A = [1];
x1_filtre = filter(h,A,signal_MFTDMA);
figure;
plot(linspace(-1/fp2,1/fp2,length(x1_filtre)),x1_filtre)
xlabel('temps en secondes')
ylabel(' signal x1 obtenu')
title('figure 14 : signal x1_filtre')

x2_filtre = filter(h_IpH,A,signal_MFTDMA);
figure;
plot(linspace(-1/fp2,1/fp2,length(x2_filtre)),x2_filtre)
xlabel('temps en secondes')
ylabel(' signal x2 obtenu')
title('figure 15 : signal x2 filtre')

% Retour en bande de base

% Implantation
x1_retour = x1_filtre;  % fp1 = 0
x2_retour = x2_filtre.*cos(2*pi*fp2*(0:Te:(length(signal)-1)*Te)+phi);


% Détection du slot

X1_1 = x1_retour(1:length(m1));
X1_2 = x1_retour(length(m1) + 1 : 2*length(m1));
X1_3 = x1_retour(2*length(m1) + 1 : 3*length(m1));
X1_4 = x1_retour(3*length(m1) + 1 : 4*length(m1));
X1_5 = x1_retour(4*length(m1) + 1 : end);

X2_1 = x2_retour(1:length(m2));
X2_2 = x2_retour(length(m2) + 1 : 2*length(m2));
X2_3 = x2_retour(2*length(m2) + 1 : 3*length(m2));
X2_4 = x2_retour(3*length(m2) + 1 : 4*length(m2));
X2_5 = x2_retour(4*length(m2) + 1 : end);

% Calcul de l'énergie du signal sur chaque tranche pour les deux utilisateurs

E1_1 = mean(abs(X1_1).^2)*length(X1_1);
E1_2 = mean(abs(X1_2).^2)*length(X1_2);
E1_3 = mean(abs(X1_3).^2)*length(X1_3);
E1_4 = mean(abs(X1_4).^2)*length(X1_4);
E1_5 = mean(abs(X1_5).^2)*length(X1_5);


E2_1 = mean(abs(X2_1).^2)*length(X2_1);
E2_2 = mean(abs(X2_2).^2)*length(X2_2);
E2_3 = mean(abs(X2_3).^2)*length(X2_3);
E2_4 = mean(abs(X2_4).^2)*length(X2_4);
E2_5 = mean(abs(X2_5).^2)*length(X2_5);

% Démodulation bande de base

SignalFiltre_1 = filter(ones(1,Ns),1,X1_2) ;
SignalEchantillonne_1 = SignalFiltre_1(Ns:Ns:end) ;
BitsRecuperes_1 = (sign(SignalEchantillonne_1)+1)/2 ;

MSG1 = bin2str(BitsRecuperes_1)


SignalFiltre_2 = filter(ones(1,Ns),1,X2_5) ;
SignalEchantillonne_2 = SignalFiltre_2(Ns:Ns:end) ;
BitsRecuperes_2 = (sign(SignalEchantillonne_2)+1)/2 ;

MSG2 = bin2str(BitsRecuperes_2)






