clear all;
close all;
clc ;

Fe = 10000;
Fp = 2000;
Te = 1/Fe;
alpha = 0.35;
Rb = 2000;
nb_bits = 10000;
M = 4; % ordre de modulation
Rs = Rb/log2(M);
Ts = 1/Rs;
Ns = Ts/Te;

% Chaine de transmission sur porteuse

%Generation de bits
bits = randi([0,1],1,nb_bits);

% Implantation de la chaine passe-bas équivalente
%  
% Mapping
ak = 2*bits(1:2:end)-1;
bk = 2*bits(2:2:end)-1;
dk = ak + 1j*bk;
% Surechontinllnage
Suite_diracs = kron(dk, [1 zeros(1,Ns-1)]);
% Filtrage de mise en forme
h = rcosdesign(alpha,20,Ns);
retard = (20*Ns)/2; 

% Filtrage de mise en forme
x_1 = filter(h,1,[Suite_diracs zeros(1,retard)]);
x_1_fp = x_1(retard+1:end);
% Tracé des signaux générés sur les voies en phase et en quadrature
I = real(x_1_fp);
Q = imag(x_1_fp);
figure(1);
plot((0:Te:length(I)*Te-Te), I);
title('signal généré sur la voie en phase');
figure(2);
plot((0:Te:length(Q)*Te-Te), Q);
title('signal généré sur la voie en quadrature');
% DSP associé à l'enveloppe complexe du signal modulé sur freq porteuse

DSP_3 = pwelch(I+1j*Q,[],[],[],Fe,'twosided');
figure(3);
plot(linspace(-Fe,Fe,length(DSP_3)),abs(DSP_3));
title('DSP associé à l enveloppe complexe du signal modulé sur fréquence porteuse (sans bruit)');

% la chaine passe-bas équivalente
P = mean(abs(x_1_fp).^2);
SNR = (0:1:6);
for i = 0:length(SNR)-1
   rapport_decibel = SNR(1,i+1)/10; 
   sigma_i = sqrt(P*Ns/(2*log2(M)*10^rapport_decibel));
   sigma_q = sigma_i;
   bruit = sigma_i*randn(1,length(x_1_fp)) + 1j*sigma_q*randn(1,length(x_1_fp));
   r = x_1_fp + bruit;
   % Filtre de rÃ©ception
   z = filter(h, 1, [r zeros(1,retard)]);
   z = z(retard+1 : end);
   figure(4);
   plot((0:Te:length(z)*Te-Te), z);
   % Echantillonage
   z_echant = z(1:Ns:end);
   % Décisions
   symboles_decides_reel = sign(real(z_echant));
   symboles_decides_imag = sign(imag(z_echant));
   symboles_decides = symboles_decides_reel + 1j*symboles_decides_imag;
   bits_decides = zeros(1, 2*length(symboles_decides));
   bits_decides_reel = (symboles_decides_reel + 1)/2;
   bits_decides_imag = (symboles_decides_imag + 1)/2;
   bits_decides(1:2:end) = bits_decides_reel;
   bits_decides(2:2:end) = bits_decides_imag;
   TEB(1,i+1) = length(find(bits_decides ~= bits))/length(bits)
end
figure(5);
semilogy(SNR, TEB, 'm--'); grid on;
TEB_th = 1 - normcdf(sqrt(2*10.^(SNR/10)));
hold on;
semilogy(SNR, TEB_th, '*-');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Constellations en srtie du mapping

scatterplot(dk);
title('Les constellations en sortie du mapping');

% Constellations en sortie de l'échantillonneur
scatterplot(z_echant);
title('Les constellations en sortie de l échantillonneur');