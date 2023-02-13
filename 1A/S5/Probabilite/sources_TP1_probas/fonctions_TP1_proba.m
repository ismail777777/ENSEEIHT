
% TP1 de Probabilites : fonctions a completer et rendre sur Moodle
% Nom : EL ALOUT
% Prénom : Ismail
% Groupe : 1SN-B

function varargout = fonctions_TP1_proba(varargin)

    switch varargin{1}     
        case 'ecriture_RVB'
            varargout{1} = feval(varargin{1},varargin{2:end});
        case {'vectorisation_par_colonne','decorrelation_colonnes'}
            [varargout{1},varargout{2}] = feval(varargin{1},varargin{2:end});
        case 'calcul_parametres_correlation'
            [varargout{1},varargout{2},varargout{3}] = feval(varargin{1},varargin{2:end}); 
    end

end

% Fonction ecriture_RVB (exercice_0.m) ------------------------------------
% (Copiez le corps de la fonction ecriture_RVB du fichier du meme nom)
function image_RVB = ecriture_RVB(image_originale)
[n,p] = size(image_originale);
image_RVB = zeros(n/2,p/2,3);
image_RVB(:,:,1) = image_originale(1:2:end,2:2:end);
image_RVB(:,:,2) = (1/2)*(image_originale(1:2:end,1:2:end)+image_originale(2:2:end,2:2:end));
image_RVB(:,:,3) = image_originale(2:2:end,1:2:end);
end

% Fonction vectorisation_par_colonne (exercice_1.m) -----------------------
function [Vd,Vg] = vectorisation_par_colonne(I)
[n,p] = size(I);
Md = I(:,2:p);
Mg = I(:,1:p-1);
Vd = Md(:);
Vg = Mg(:);

end

% Fonction calcul_parametres_correlation (exercice_1.m) -------------------
function [r,a,b] = calcul_parametres_correlation(Vd,Vg)
Var_d = mean(Vd.*Vd)-mean(Vd)^2;
Var_g = mean(Vg.*Vg)-mean(Vg)^2;
Cov = mean(Vd.*Vg)-mean(Vd)*mean(Vg);
r = Cov/(sqrt(Var_d)*sqrt(Var_g));
a = Cov/Var_d;
b = -a*mean(Vd)+mean(Vg);

end

% Fonction decorrelation_colonnes (exercice_2.m) --------------------------
function [I_decorrelee,I_min] = decorrelation_colonnes(I,I_max)
[n,p] = size(I);
I_decorrelee = I;
for i=0:p-2
    I_decorrelee(:,p-i) = I_decorrelee(:,p-i) - I_decorrelee(:,p-i-1);
end
I_min = min(I(:));
I_min = I_min - I_max;
end



