clear all;
close all;
%% On fait varier la base d'apprentissage et on teste avec la fonction kppv
%% CHOIX DES DONNÉES
% liste des différentes personnes
liste_personnes = {
 'f01', 'f02', 'f03', 'f04', 'f05', 'f06', 'f07', 'f08', 'f09', 'f10', 'f11', 'f12', 'f13', 'f14', 'f15', 'f16', 'm01', 'm02', 'm03', 'm04', 'm05', 'm06', 'm07', 'm08', 'm09', 'm10', 'm11', 'm12', 'm13', 'm14', 'm15', 'm16'
                  };
nb_personnes = length(liste_personnes);
% liste des différentes postures 
liste_postures = {'v1e1', 'v3e1', 'v1e2', 'v3e2', 'v1e3', 'v3e3'};
nb_postures = length(liste_postures);
nb_lignes = 400;
nb_colonnes = 300;
% personnes constituant la base d'apprentissage (À FAIRE EVOLUER)
liste_personnes_base = {'f06', 'f14', 'm13', 'm06', 'f09', 'f08', 'f12'}
%liste_personnes_base = liste_personnes(1,1:15);
%       personnes          1     10     17     24     
nb_personnes_base = length(liste_personnes_base); 
%liste_personnes_base = {'f01', 'f10', 'm10', 'm08'} % clusters séparés
% postures de la base d'apprentissage (À FAIRE EVOLUER)
liste_postures_base = [1 2 3 4 5] ;
nb_postures_base = length(liste_postures_base);
%% LECTURE DES DONNÉES SANS MASQUE
X = [];
liste_base = [];
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);
figure('Name','Personnes','Position',[0,0,0.80*L,0.80*H]);
colormap(gray(256));
% Affichage des images sous forme de planche-contact 
% (une personne par ligne, une posture par colonne) :
for j = 1:nb_personnes_base,
    no_posture = 0;
	for k = liste_postures_base,
        no_posture = no_posture + 1;
        
        ficF = strcat('./Data/', liste_personnes_base{j}, liste_postures{k}, '-300x400.gif')
        liste_base = [liste_base ; ficF];
        img = imread(ficF);
        % Remplissage de la matrice X :
        X = [X ; double(transpose(img(:)))];
        
        % Affichage
		subplot(nb_personnes_base, nb_postures_base, (j-1)*nb_postures_base + no_posture);
		imagesc(img);
		hold on;
		axis image;
		title(['Personne ' liste_personnes_base{j} ', posture ' num2str(k)]);
        
	end
end
%% CALCUL ET AFFICHAGE DES EIGENFACES SANS MASQUE
% Calcul de l'individu moyen :
n = size(X,1);
individu_moyen = ones(1,n)*X/n;
% Centrage de la matrice X (extension automatique de individu_moyen) :
X_centre = X - individu_moyen;
% Calcul de la matrice de covariance (impossible à calculer ainsi à cause de sa taille) :
% Sigma = X_centre'*X_centre/n;
% Calcul de la matrice résultant du calcul alternatif :
Sigma2 = X_centre*X_centre'/n;
% Calcul des vecteurs/valeurs propres de la matrice Sigma2 :
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% VOUS POUVEZ REMPLACER L'APPEL À EIG PAR UN APPEL À L'UNE DE VOS FONCTIONS
% SUBSPACE ITERATION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[D, V_2] = subspace_iter_v3(Sigma2, n, 0.75, 10, 1e-8, 5000);
% Tri par ordre décroissant des valeurs propres de Sigma2 :
[lambda, indices] = sort(diag(D), 'descend');
% Les vecteurs propres de Sigma (les eigenfaces) se déduisent de ceux de Sigma2 :
V = X_centre'*V_2;
% Tri des eigenfaces dans l'ordre des valeurs propres correspondantes 
% (on enlève la dernière eigenface, qui appartient au noyau de Sigma) :
W = V(:, indices);
W = W(:, 1:end-1);
% Normalisation des eigenfaces (qui ne le sont pas par construction) :
W = normalize(W, 'norm');




% Tirage aléatoire d'une image de test :
personne = randi(nb_personnes)
posture = randi(nb_postures)
% si on veut tester/mettre au point, on fixe l'individu
%personne = 10
%posture = 6

ficF = strcat('./Data/', liste_personnes{personne}, liste_postures{posture}, '-300x400.gif')
img = imread(ficF);
image_test = double(transpose(img(:)));
 


% Nombre q de composantes principales à prendre en compte 
% q = 2;

% dans un second temps, q peut être calculé afin d'atteindre le pourcentage
% d'information avec q valeurs propres (contraste)
% Pourcentage d'information 
% per = 0.75;

%...
q = 15;
DataA = X*W(:,1:q);
LabelA = liste_base;
image_test = double(transpose(img(:)));
DataT = image_test*W(:,1:q);
[rep_compactes, label_individus] = kppv(DataA, LabelA, DataT, 1, 1);
%[label_individus] = bayesien(DataA, DataT);
% individu pseudo-résultat pour l'affichage (A CHANGER)
personne_proche = 1;
posture_proche = 1;
ficF_res = label_individus(1,:);
img_res = imread(ficF_res);
figure('Name','Image tiree aleatoirement','Position',[0.2*L,0.2*H,0.8*L,0.5*H]);

subplot(1, 2, 1);
% Affichage de l'image de test :
colormap gray;
imagesc(img);
title({['Individu de test : posture ' num2str(posture) ' de ', liste_personnes{personne}]}, 'FontSize', 20);
axis image;

ficF = strcat('./Data/', liste_personnes_base{personne_proche}, liste_postures{posture_proche}, '-300x400.gif')
img = imread(ficF);
        
subplot(1, 2, 2);
imagesc(img_res);
title({['Individu la plus proche : posture ' num2str(posture_proche) ' de ', liste_personnes_base{personne_proche}]}, 'FontSize', 20);
axis image;
% Calcul de la matrice e confusion 
 Confusion = confusionmat(img(:), img_res(:))















%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% AVEC MASQUE
%%%%%%%%%%%%%%%%%%%%%%%%%%
ligne_min = 200;
ligne_max= 350;
colonne_min = 60;
colonne_max = 290;
%% LECTURE DES DONNÉES AVEC MASQUE
X_masque = [];
figure('Name','Personnes avec Masque','Position',[0,0,0.67*L,0.67*H]);
colormap(gray(256));
for j = 1:nb_personnes_base,
    no_posture = 0;
	for k = liste_postures_base,
        no_posture = no_posture + 1;
        
        ficF = strcat('./Data/', liste_personnes_base{j}, liste_postures{k}, '-300x400.gif')
        img = imread(ficF);
        img(ligne_min:ligne_max,colonne_min:colonne_max) = 0;
        % Remplissage de la matrice X_masque :
        X_masque= [X_masque; double(transpose(img(:)))];
        % Affichage
		subplot(nb_personnes_base, nb_postures_base, (j-1)*nb_postures_base + no_posture);
		imagesc(img);
		hold on;
		axis image;
		title(['Personne ' liste_personnes_base{j} ', posture ' num2str(k)]);
        
    end
end
% les eigenfaces avec masque
% Calcul de l'individu moyen :
n2 = size(X_masque,1);
individu_moyen_masque = ones(1,n2)*X_masque/n2;
% Centrage de la matrice X :
X_masque_centre = X_masque - individu_moyen_masque;
% Calcul de la matrice de covariance (impossible a calculer ainsi a cause de sa taille) :
% Sigma_masque = transpose(X_masque_centre)*X_masque_centre/n2;
% Calcul de la matrice resultant du calcul alternatif
Sigma2_masque = (1/n2)*X_masque_centre*(X_masque_centre)';
% Calcul des vecteurs/valeurs propres de la matrice Sigma2 :
[Val_propres_masque_2,Vec_propres_masque_2] = subspace_iter_v3(Sigma2_masque, n2, 1, 10, 1e-8, 5000);
% Les vecteurs propres de Sigma (les eigenfaces) se deduisent de ceux de Sigma2 :
Vec_propres_masque = (X_masque_centre)'*Vec_propres_masque_2;
% Tri par ordre decroissant des valeurs propres de Sigma2 :
[Val_propres_masque, J1] = sort(diag(Val_propres_masque_2), 'descend');
% Tri des eigenfaces dans le meme ordre 
% (on enleve la derniere eigenface, qui appartient au noyau de Sigma) :
W_masque = Vec_propres_masque(:, J1);
W_masque = W_masque(:,1:end - 1);
% Normalisation des eigenfaces :
W_masque = normalize(W_masque, 'norm');










 % Dimensions du masque
ligne_min = 200;
ligne_max = 350;
colonne_min = 60;
colonne_max = 290;

ficF = strcat('./Data/', liste_personnes{personne}, liste_postures{posture}, '-300x400.gif')
img2 = imread(ficF);
img2(ligne_min:ligne_max,colonne_min:colonne_max) = 0;
image_test_2 = double(transpose(img2(:)));

q = 15;
DataA_masque = X_masque*W_masque(:,1:q);
LabelA = liste_base;
DataT_masque = image_test_2*W_masque(:,1:q);
[rep_compactes, label_individus] = kppv(DataA_masque, LabelA, DataT_masque, 1, 3);
%[label_individus] = bayesien(DataA_masque, DataT_masque);
% individu pseudo-résultat pour l'affichage (A CHANGER)
% personne_proche = 1;
% posture_proche = 1;
ficF_res = label_individus(1,:);
img_res = imread(ficF_res);
figure('Name','Image tiree aleatoirement','Position',[0.2*L,0.2*H,0.8*L,0.5*H]);

subplot(1, 2, 1);
% Affichage de l'image de test :
colormap gray;
imagesc(img2);
title({['Individu de test : posture ' num2str(posture) ' de ', liste_personnes{personne}]}, 'FontSize', 20);
axis image;

        
subplot(1, 2, 2);
imagesc(img_res);
title({['Individu la plus proche ']}, 'FontSize', 20);
axis image;