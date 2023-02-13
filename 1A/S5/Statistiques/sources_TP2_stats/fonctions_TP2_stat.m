
% TP2 de Statistiques : fonctions a completer et rendre sur Moodle
% Nom : EL ALOUT
% Prénom : ISMAIL
% Groupe : 1SN-B

function varargout = fonctions_TP2_stat(varargin)

    [varargout{1},varargout{2}] = feval(varargin{1},varargin{2:end});

end

% Fonction centrage_des_donnees (exercice_1.m) ----------------------------
function [x_G, y_G, x_donnees_bruitees_centrees, y_donnees_bruitees_centrees] = ...
                centrage_des_donnees(x_donnees_bruitees,y_donnees_bruitees)
x_G = 1/length(x_donnees_bruitees)*sum(x_donnees_bruitees);
y_G = 1/length(x_donnees_bruitees)*sum(y_donnees_bruitees);
x_donnees_bruitees_centrees = x_donnees_bruitees - x_G;
y_donnees_bruitees_centrees = y_donnees_bruitees - y_G;
     
end

% Fonction estimation_Dyx_MV (exercice_1.m) -------------------------------
function [a_Dyx,b_Dyx] = ...
           estimation_Dyx_MV(x_donnees_bruitees,y_donnees_bruitees,n_tests)
psi = (rand(n_tests,1)-0.5)*2*(pi/2);
[x_G, y_G, x_donnees_bruitees_centrees, y_donnees_bruitees_centrees] = centrage_des_donnees(x_donnees_bruitees,y_donnees_bruitees);
n = length(repmat(x_donnees_bruitees_centrees,n_tests,1));
ecart = repmat(y_donnees_bruitees_centrees,n_tests,1) - tan(repmat(psi,1,n))*repmat(x_donnees_bruitees_centrees,n_tests,1);
resi = sum(ecart.^2,2);
[mini,pos] = min(resi);
a_Dyx = tan(psi(pos));
b_Dyx = y_G - a_Dyx*x_G;
    
end

% Fonction estimation_Dyx_MC (exercice_2.m) -------------------------------
function [a_Dyx,b_Dyx] = ...
                   estimation_Dyx_MC(x_donnees_bruitees,y_donnees_bruitees)
A = [x_donnees_bruitees',ones(1,length(x_donnees_bruitees))'];
B = y_donnees_bruitees';
X =A\B;
a_Dyx = X(1);
b_Dyx = X(2);


    
end

% Fonction estimation_Dorth_MV (exercice_3.m) -----------------------------
function [theta_Dorth,rho_Dorth] = ...
         estimation_Dorth_MV(x_donnees_bruitees,y_donnees_bruitees,n_tests)
theta = rand(n_tests,1)*pi;
[x_G, y_G, x_donnees_bruitees_centrees, y_donnees_bruitees_centrees] = centrage_des_donnees(x_donnees_bruitees,y_donnees_bruitees);
n = length(repmat(x_donnees_bruitees_centrees,n_tests,1));
ecart = cos(repmat(theta,1,n))*repmat(x_donnees_bruitees_centrees,n_tests,1) + sin(repmat(theta,1,n))*repmat(y_donnees_bruitees_centrees,n_tests,1);
resi = sum(ecart.^2,2);
[mini,pos] = min(resi);
theta_Dorth = theta(pos);
rho_Dorth = x_G*cos(theta_Dorth) + y_G*sin(theta_Dorth);

end

% Fonction estimation_Dorth_MC (exercice_4.m) -----------------------------
function [theta_Dorth,rho_Dorth] = ...
                 estimation_Dorth_MC(x_donnees_bruitees,y_donnees_bruitees)
n = size(x_donnees_bruitees,2);
M = zeros(n,2);
[x_G, y_G, x_donnees_bruitees_centrees, y_donnees_bruitees_centrees] = centrage_des_donnees(x_donnees_bruitees,y_donnees_bruitees)
M(:,1) = transpose(x_donnees_bruitees_centrees);
M(:,2) = transpose(y_donnees_bruitees_centrees);
N = transpose(M)*M;
[vect_propres,matrice_propre] = eig(N);
indice = find(diag(matrice_propre))==min(diag(matrice_propre));
V = vect_propres(:,indice);
cos_theta = V(1);
sin_theta = V(2);
rho_Dorth= mean(x_donnees_bruitees)*cos_theta + mean(y_donnees_bruitees)*sin_theta;
theta_Dorth= tana(sin_theta/cos_theta);

end
