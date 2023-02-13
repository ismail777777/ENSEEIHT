%3.1 Génération du signal à filtrer
f1 = 1000;
f2 = 3000;
Fe = 10000;
Te = 1/Fe;
N = 100;
x = cos(2*pi*f1*(0:Te:(N-1)*Te)) + cos(2*pi*f2*(0:Te:(N-1)*Te));
plot((0:Te:(N-1)*Te),x)
xlabel("temps en seconde");
ylabel("signal x");
TF_x = fft(x);
figure
semilogy((0:Fe:(N-1)*Fe),abs(TF_x))
xlabel("Fréquence en Hz");
ylabel("TFD du signal x");
%3.2 Synthèse du filtre passe-bas
N1 = 5;
N2 = 30;
A = [1];
B1 = 2*f1*sinc(2*f1*Te*(-N1:1:N1));
B2 = 2*f1*sinc(2*f1*Te*(-N2:1:N2));
y1 = filter(B1,A,x);
y2 = filter(B2,A,x);
TF_y1 = fft(y1);
TF_y2 = fft(y2);
figure
semilogy(linspace(0,Fe,length(TF_y1)),abs(TF_y1))
figure
semilogy(linspace(0,Fe,length(TF_y2)),abs(TF_y2))
%3.3 Réalisation du filtrage
figure
semilogy((0:Fe:(N-1)*Fe),abs(TF_x))
hold on
semilogy(linspace(0,Fe,length(TF_y1)),abs(TF_y1))
hold on
semilogy(linspace(0,Fe,length(TF_y2)),abs(TF_y2))
legend('TF_X','TF_y1','TF_y2')
