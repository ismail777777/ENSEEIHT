
% TP1 de Statistiques : fonctions a completer et rendre sur Moodle
% Nom : EL ALOUT
% Prénom : ISMAIL
% Groupe : 1SN-B

function varargout = fonctions_TP1_stat(varargin)

    [varargout{1},varargout{2}] = feval(varargin{1},varargin{2:end});

end

% Fonction G_et_R_moyen (exercice_1.m) ----------------------------------
function [G, R_moyen, distances] = ...
         G_et_R_moyen(x_donnees_bruitees,y_donnees_bruitees)
G = 1/length(x_donnees_bruitees)*[sum(x_donnees_bruitees),sum(y_donnees_bruitees)];
distances = sqrt((x_donnees_bruitees - G(1)).^2 + (y_donnees_bruitees - G(2)).^2);
R_moyen = 1/length(distances)*sum(distances);
end

% Fonction estimation_C_uniforme (exercice_1.m) ---------------------------
function [C_estime, R_moyen] = ...
         estimation_C_uniforme(x_donnees_bruitees,y_donnees_bruitees,n_tests)
n = length(x_donnees_bruitees);
[G, R_moyen,v] = G_et_R_moyen(x_donnees_bruitees,y_donnees_bruitees);
C = G + (rand(n_tests,2)-0.5)*2*R_moyen;
ecart_x = repmat(x_donnees_bruitees,n_tests,1) - repmat(C(:,1),1,n);
ecart_y = repmat(y_donnees_bruitees,n_tests,1) - repmat(C(:,2),1,n);
ecart = sqrt(ecart_x.^2 + ecart_y.^2) - R_moyen;
[mini,pos] = min(sum(ecart.^2,2));
C_estime = C(pos,:);
     

end

% Fonction estimation_C_et_R_uniforme (exercice_2.m) ----------------------
function [C_estime, R_estime] = ...
         estimation_C_et_R_uniforme(x_donnees_bruitees,y_donnees_bruitees,n_tests)
[G, R_moyen,v] = G_et_R_moyen(x_donnees_bruitees,y_donnees_bruitees);
C = G + (rand(n_tests,2)-0.5)*2*R_moyen;
R = (rand(n_tests,1)+0.5)*R_moyen;
n = length(x_donnees_bruitees);
ecart_x = repmat(x_donnees_bruitees,n_tests,1) - repmat(C(:,1),1,n);
ecart_y = repmat(y_donnees_bruitees,n_tests,1) - repmat(C(:,2),1,n);
ecart = sqrt(ecart_x.^2 + ecart_y.^2) - repmat(R,1,n);
resi = sum(ecart.^2,2);
[mini,pos] = min(resi);
C_estime = C(pos,:);
R_estime = R(pos,:);
end

% Fonction occultation_donnees (donnees_occultees.m) ----------------------
function [x_donnees_bruitees, y_donnees_bruitees] = ...
         occultation_donnees(x_donnees_bruitees, y_donnees_bruitees, theta_donnees_bruitees)
theta = rand(2,1)*2*pi;
if theta(1) <= theta(2)
    condition = find(theta(1) <= theta_donnees_bruitees & theta_donnees_bruitees <= theta(2));
else
    condition = find( 0 <= theta_donnees_bruitees & theta_donnees_bruitees<= theta(2) | theta(1) <= theta_donnees_bruitees & theta_donnees_bruitees < 2*pi);
end
x_donnees_bruitees = x_donnees_bruitees(condition);
y_donnees_bruitees = y_donnees_bruitees(condition);
end

% Fonction estimation_C_et_R_normale (exercice_4.m, bonus) ----------------
function [C_estime, R_estime] = ...
         estimation_C_et_R_normale(x_donnees_bruitees,y_donnees_bruitees,n_tests)

[G, R_moyen,v] = G_et_R_moyen(x_donnees_bruitees,y_donnees_bruitees);
C = G + (rand(n_tests,2)-0.5)*2*R_moyen;
R = (randn(n_tests,1)+0.5)*R_moyen;
n = length(x_donnees_bruitees);
ecart_x = repmat(x_donnees_bruitees,n_tests,1) - repmat(C(:,1),1,n);
ecart_y = repmat(y_donnees_bruitees,n_tests,1) - repmat(C(:,2),1,n);
ecart = sqrt(ecart_x.^2 + ecart_y.^2) - repmat(R,1,n);
resi = sum(ecart.^2,2);
[mini,pos] = min(resi);
C_estime = C(pos,:);
R_estime = R(pos,:);

end
