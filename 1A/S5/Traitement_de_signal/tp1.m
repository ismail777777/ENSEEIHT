%2.1 Représentation temporelle
f0 = 1100;
Fe = 10000;
Te = 1/Fe;
N = 90;
x = cos(2*pi*f0*(0:Te:(N-1)*Te))
plot((0:Te:(N-1)*Te),x)
xlabel("temps en seconde");
ylabel("signal x");

Fe2 = 1000;
Te2 = 1/Fe2;
x2 = cos(2*pi*f0*(0:Te2:(N-1)*Te2))
x2(1)
figure
plot((0:Te2:(N-1)*Te2),x2)
xlabel("temps en seconde");
ylabel("signal x2");
%critère de Shannon Fe > 2fmax 

%2.2 Représentation fréquentielle
TF_x = fft(x);
figure
semilogy((0:Fe:(N-1)*Fe),abs(TF_x))
xlabel("Fréquence en Hz");
ylabel("TFD du signal x");

TF_x2 = fft(x2);
figure
semilogy((0:Fe2:(N-1)*Fe2),abs(TF_x2))
xlabel("Fréquence en Hz");
ylabel("TFD du signal x2");

N1 = 150;
N2 = 100;
N3 = 180;
N4 = 2^8;
N5 = 1024;
X1 = fft(x,N1);
figure
semilogy(linspace(0,Fe,length(X1)),abs(X1))
X2 = fft(x,N2);
figure
semilogy(linspace(0,Fe,length(X2)),abs(X2))
X3 = fft(x,N3);
figure
semilogy(linspace(0,Fe,length(X3)),abs(X3))
X4 = fft(x,N4);
figure
semilogy(linspace(0,Fe,length(X4)),abs(X4))
X5 = fft(x,N5);
figure
semilogy(linspace(0,Fe,length(X5)),abs(X5))
Rx = 0;
for i=1:N
    Rx = Rx +  x(i)*conj(x(i));
end
R_x = (1/N) * Rx;
Sx = fft(R_x);
figure
semilogy(linspace(0,Fe,length(Sx)),abs(Sx))