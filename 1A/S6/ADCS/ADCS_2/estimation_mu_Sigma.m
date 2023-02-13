function [mu sigma]=estimation_mu_Sigma(I)
[n,~]=size(I);
mu=I'*ones(n,1)/n;
Ic=I-ones(n,1)*mu';
sigma=Ic'*Ic/n;
end