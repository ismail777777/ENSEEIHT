clear all;
close all;
clc ;

Fe = 96000;
Fp = 2000;
Te = 1/Fe;
alpha = 0.5;
Rb = 48000;
nb_bits = 10000;
M = 4; % ordre de modulation
Rs = Rb/log2(M);
Ts = 1/Rs;
Ns = Ts/Te;
% Chaine de transmission sur porteuse
%  Modulation QPSK

%Generation de bits
bits = randi([0,1],1,nb_bits);

 %Mapping
y = pskmod(bits,M);

 %Surechontinllnage
Suite_diracs = kron(y, [1 zeros(1,Ns-1)]);

%Filtrage de mise en forme
h = rcosdesign(alpha,20,Ns);
retard = (20*Ns)/2; 

%Filtrage de mise en forme
x_1 = filter(h,1,[Suite_diracs zeros(1,retard)]);
x_1_fp = x_1(retard+1:end);
t = 0:Te:length(x_1_fp)*Te-Te;
Signal = x_1_fp .* exp(1j*2*pi*Fp*t);

signal_reel = real(Signal);
S1 = signal_reel.*cos(2*pi*Fp*t);
S2 = signal_reel.*sin(2*pi*Fp*t);
S = S1 - 1j*S2;

% Filtre de réception
z = filter(h, 1, [S zeros(1,retard)]);
z = z(retard+1 : end);
figure(1);
plot((0:Te:length(z)*Te-Te), z);
% Echantillonage
z_echant = z(1:Ns:end);
% Décisions
symboles_decides_reel = sign(real(z_echant));
symboles_decides_imag = sign(imag(z_echant));
symboles_decides = symboles_decides_reel + 1j*symboles_decides_imag;
bits_decides = pskdemod(symboles_decides, M);


% Calcul du TEB
TEB = length(find(bits_decides ~= bits))
