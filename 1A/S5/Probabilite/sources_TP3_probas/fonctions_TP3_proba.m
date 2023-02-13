
% TP3 de Probabilites : fonctions a completer et rendre sur Moodle
% Nom : EL ALOUT
% Prénom : Ismail
% Groupe : 1SN-B

function varargout = fonctions_TP3_proba(varargin)

    switch varargin{1}
        
        case 'matrice_inertie'
            
            [varargout{1},varargout{2}] = feval(varargin{1},varargin{2:end});
            
        case {'ensemble_E_recursif','calcul_proba'}
            
            [varargout{1},varargout{2},varargout{3}] = feval(varargin{1},varargin{2:end});
    
    end
end

% Fonction ensemble_E_recursif (exercie_1.m) ------------------------------
function [E,contour,G_somme] = ...
    ensemble_E_recursif(E,contour,G_somme,i,j,voisins,G_x,G_y,card_max,cos_alpha)
[n,p] = size(voisins);
p = 1;
contour(i,j) = 0;
while p <= n && size(E,1) <= card_max
    i1 = i + voisins(p,1);
    j1 = j + voisins(p,2);
    if contour(i1,j1) == 1
        grad = [G_x(i1,j1),G_y(i1,j1)];
        if dot(grad/norm(grad),G_somme/norm(G_somme)) >= cos_alpha
            E = [E; i1 j1];
            G_somme = G_somme + [i1,j1];
            [E,contour,G_somme] = ensemble_E_recursif(E,contour,G_somme,i1,j1,voisins,G_x,G_y,card_max,cos_alpha);
        end
    end
    p = p+1;
end
end

% Fonction matrice_inertie (exercice_2.m) ---------------------------------
function [M_inertie,C] = matrice_inertie(E,G_norme_E)
pi = sum(G_norme_E(1:size(E,1)));
C = zeros(1,2);
E1 = E(:,1);
E2 = E(:,2);
C(1,1) = (1/pi)*sum(G_norme_E(1:size(E,1)).*E1(1:size(E,1)));
C(1,2) = (1/pi)*sum(G_norme_E(1:size(E,1)).*E2(1:size(E,1)));
M_inertie = zeros(2);
M_inertie(1,1) = (1/pi)*sum(G_norme_E(1:size(E,1)).*(E1(1:size(E,1))-C(1,1)).^2);
M_inertie(2,2) = (1/pi)*sum(G_norme_E(1:size(E,1)).*(E2(1:size(E,1))-C(1,2)).^2);
M_inertie(1,2) = (1/pi)*sum(G_norme_E(1:size(E,1)).*(E1(1:size(E,1))-C(1,1)).*(E2(1:size(E,1))-C(1,2)));
M_inertie(2,1) = M_inertie(1,2);
end

% Fonction calcul_proba (exercice_2.m) ------------------------------------
function [x_min,x_max,probabilite] = calcul_proba(E_nouveau_repere,p)
x_min = min(E_nouveau_repere(:,1));
x_max = max(E_nouveau_repere(:,1));
y_max = max(E_nouveau_repere(:,2));
y_min = min(E_nouveau_repere(:,2));
n = size(E_nouveau_repere(:,1));
N = (x_max-x_min)*(y_max-y_min);
probabilite = 1;
if n <= floor(N)-1
    for k = 0:n-1
    probabilite = probabilite - nchoosek(floor(N),k)*(p^k)*((1-p)^(floor(N)-k));
    end
else
    for k = 0:floor(N)
    probabilite = probabilite - nchoosek(floor(N),k)*(p^k)*((1-p)^(floor(N)-k));
    end
end
end
