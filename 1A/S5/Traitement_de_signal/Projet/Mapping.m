function [Symboles,Ns] = mapping(bits,Fe,Rb)
Ns = Fe/Rb;
Symboles = 2*bits - 1;
end