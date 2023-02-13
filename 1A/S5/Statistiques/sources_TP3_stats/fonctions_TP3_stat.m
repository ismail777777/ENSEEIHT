
% TP3 de Statistiques : fonctions a completer et rendre sur Moodle
% Nom : EL ALOUT
% Prenom : ISMAIL
% Groupe : 1SN-B

function varargout = fonctions_TP3_stat(varargin)

    [varargout{1},varargout{2}] = feval(varargin{1},varargin{2:end});

end

% Fonction estimation_F (exercice_1.m) ------------------------------------
function [rho_F,theta_F,ecart_moyen] = estimation_F(rho,theta)
A = [cos(theta),sin(theta)];
B = rho;
X = A\B;
rho_F = sqrt(X(1,1)^2 + X(2,1)^2);
theta_F = atan2(X(2,1),X(1,1));



    % A modifier lors de l'utilisation de l'algorithme RANSAC (exercice 2)
    ecart_moyen = mean(sum(abs(rho - rho_F*cos(theta - theta_F))));

end

% Fonction RANSAC_2 (exercice_2.m) ----------------------------------------
function [rho_F_estime,theta_F_estime] = RANSAC_2(rho,theta,parametres)
[~,~,ecart_min] = estimation_F(rho,theta);
for i = 1:parametres(3)
    indices = randperm(size(rho,1),2);
    [rho_F,theta_F,ecart_moyen] = estimation_F(rho(indices),theta(indices));
    donnees_conformes = ecart_moyen < parametres(1);

    if sum(donnees_conformes) / length(donnees_conformes) > parametres(2)
        if ecart_moyen < ecart_min
            ecart_min = ecart_moyen;
            rho_F_estime = rho_F;
            theta_F_estime = theta_F;
        end
    end
end
end

% Fonction G_et_R_moyen (exercice_3.m, bonus, fonction du TP1) ------------
function [G, R_moyen, distances] = ...
         G_et_R_moyen(x_donnees_bruitees,y_donnees_bruitees)
G = 1/length(x_donnees_bruitees)*[sum(x_donnees_bruitees),sum(y_donnees_bruitees)];
distances = sqrt((x_donnees_bruitees - G(1)).^2 + (y_donnees_bruitees - G(2)).^2);
R_moyen = 1/length(distances)*sum(distances);
end

% Fonction estimation_C_et_R (exercice_3.m, bonus, fonction du TP1) -------
function [C_estime,R_estime,critere] = ...
         estimation_C_et_R(x_donnees_bruitees,y_donnees_bruitees,n_tests,C_tests,R_tests)
     
    % Attention : par rapport au TP1, le tirage des C_tests et R_tests est 
    %             considere comme etant deje effectue 
    %             (il doit etre fait au debut de la fonction RANSAC_3)

n = length(x_donnees_bruitees);
[G, R_moyen,v] = G_et_R_moyen(x_donnees_bruitees,y_donnees_bruitees);
C = G + (rand(n_tests,2)-0.5)*2*R_moyen;
ecart_x = repmat(x_donnees_bruitees,n_tests,1) - repmat(C(:,1),1,n);
ecart_y = repmat(y_donnees_bruitees,n_tests,1) - repmat(C(:,2),1,n);
ecart = sqrt(ecart_x.^2 + ecart_y.^2) - R_moyen;
[mini,pos] = min(sum(ecart.^2,2));
C_estime = C(pos,:);

end

% Fonction RANSAC_3 (exercice_3, bonus) -----------------------------------
function [C_estime,R_estime] = ...
         RANSAC_3(x_donnees_bruitees,y_donnees_bruitees,parametres)
     
    % Attention : il faut faire les tirages de C_tests et R_tests ici


end
