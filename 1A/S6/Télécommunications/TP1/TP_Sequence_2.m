%% Etude de transmissions en bande de base %%


clear;
close all;
clc;

% Decclarations des constantes
Fe = 24000;
Rb = 3000;
Tb = 1/Rb;
Te = 1/Fe;
m1 = 2;
m2 = 4;

%% Séquence 2 %%    
%% Etude des interferences entre symbole et du critere de Nyquist %%

% 4.2 Etude sans canal de propagation

% Implantation du bloc modulateur et demodulateur

% Generation des bits   
bits = randi([0,1],1,200);

% Mapping
Symboles = 2*bits-1;
Ns = Fe/Rb;
h = ones(1,Ns);

% Surechantillonage
Suite_diracs = kron(Symboles,[1 zeros(1,Ns-1)]);

%Suite_diracs = Suite_diracs(:,1);
% Filtrage
x = filter(h,1,Suite_diracs);

% Tracé du signal en sortie du filtre de reception 
figure(1);
plot((0:Te:length(x)*Te-Te),x); grid on;
xlabel("Temps en secondes");
ylabel("Signal transmis");
title("Signal transmis en fonction du temps ");

% Calcul de la DSP
DSP = pwelch(x, [], [], [], Fe, 'twosided');
figure(2);
plot(linspace(-Fe/2,Fe/2,length(DSP)),fftshift(abs(DSP))); grid on;
xlabel("Frequence en Hz");
ylabel("DSP");
title(" Trace de la DSP du signal en sortie en fonction de la frequence ");

% Demodulateur
signal_filtre = filter(h,1,x);
figure(3);
plot((0:Te:length(signal_filtre)*Te-Te),signal_filtre); grid on;
xlabel("Temps en secondes");
ylabel("Signal en sortie du filtre de récéption");
title("Signal en sortie du filtre de récéption en fonction du temps ");


% Réponse impulsionnelle globale de la chaine de transmission g
g = conv(h,h);
figure(4);
plot(g); grid on;
xlabel("Frequence en Hz");
ylabel("Reponse impulsionnelle");
title("La reponse impulsionnelle globale de la chaine de transmission g");

% Diagramme de l'oeil
figure(5);
plot(reshape(signal_filtre(Ns+1:end),Ns,length(signal_filtre(Ns+1:end))/Ns));grid on;
xlabel("Temps");
ylabel("Amplitude du signal");
title("Diagramme de l'oeil");



% Echantillonnage du signal en sortie du filtre de reception
n0 = 8;
signal_echant = signal_filtre(n0:Ns:end);

% Detecteur a seuil
symboles_decides = sign(signal_echant);

% TEB
bits_decides = (symboles_decides + 1)/2;
TEB = length(find(bits_decides ~= bits));

% Echantillonnage du signal en sortie du filtre de réception avec n0
n0_1 = 3;
signal_echant_2 = signal_filtre(n0_1:Ns:end);
% Detecteur a seuil
symboles_decides2 = sign(signal_echant_2);

% TEB
bits_decides2 = (symboles_decides2 + 1)/2;
TEB2 = length(find(bits_decides2 ~= bits));

% 4.3 Etude avec canal de propagation sans bruit
% Etude avec canal de propagation sans bruit
fc1 =  1000;%8000;
N = 31;
hc1 = (2*fc1/Fe)*sinc(2*(fc1/Fe)*(-(N-1)/2:(N-1)/2));

% Réponse impulsionnelle globale de la chaine de transmission g
g1 = conv(g,hc1); 
figure(6);
plot(g1); grid on;
xlabel("Temps en seconde");
ylabel("Reponse impulsionnelle");
title("La reponse impulsionnelle globale de la chaine de transmission g");
% Filtre passe-bas du canal de propagation
signal_filtre_1 = filter(hc1,1,x);
%Filtre de récéption
signal_filtre_2 = filter(h,1,signal_filtre_1);
%Diagramme de l'oeil
figure(7);
plot(reshape(signal_filtre_2(Ns+1:end),Ns,length(signal_filtre_2(Ns+1:end))/Ns));

figure(8);
Hc = fft(hc1);
semilogy((0:Te:length(Hc)*Te - Te), abs(Hc));
xlabel("Frequence en Hz");
ylabel("Reponse en fréquence");

figure(9);
semilogy((0:Te:length((fft(h)).^2)*Te - Te), abs(fft(h)).^2);
xlabel("Frequence en Hz");
ylabel("Reponse en fréquence");

% Echantillonnage du signal en sortie du filtre de reception
n0 = 8;
signal_echant_2 = signal_filtre_2(n0:Ns:end);

% Detecteur a seuil
symboles_decides_3 = sign(signal_echant_2);

% TEB
bits_decides_3 = (symboles_decides_3 + 1)/2;
TEB3 = length(find(bits_decides_3 ~= bits));

