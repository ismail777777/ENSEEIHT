clear all;
close all;


%%%%%%%% CHOIX DES DONNEES
%%%%%%%%%%%%%%%%%%%%%%%%%%

% liste des differentes personnes
liste_personnes = {
 'f01', 'f02', 'f03', 'f04', 'f05', 'f06', 'f07', 'f08', 'f09', 'f10', 'f11', 'f12', 'f13', 'f14', 'f15', 'f16', 'm01', 'm02', 'm03', 'm04', 'm05', 'm06', 'm07', 'm08', 'm09', 'm10', 'm11', 'm12', 'm13', 'm14', 'm15', 'm16'
                   };
nb_personnes = length(liste_personnes);

% liste des differentes postures 
liste_postures = {'v1e1','v3e1','v1e2','v3e2','v1e3','v3e3'};
nb_postures = length(liste_postures);

nb_lignes = 400;
nb_colonnes = 300;

% personnes constituant la base d'apprentissage (A FAIRE EVOLUER)
liste_personnes_base = {'f01', 'f10', 'm01', 'm08'}
%       personnes          1     10     17     24     
%liste_personnes_base = {'f01', 'f10', 'm10', 'm08'} clusters mieux séparés
nb_personnes_base = length(liste_personnes_base); 

% postures de la base d'apprentissage (A FAIRE EVOLUER)
liste_postures_base = [1 2 3 4];
nb_postures_base = length(liste_postures_base);

%%%%%%%% LECTURE DES DONNES SANS MASQUE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
X = [];
liste_base = [];

taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);
figure('Name','Personnes','Position',[0,0,0.67*L,0.67*H]);
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

%%%%%%%% CALCUL ET AFFICHAGE DES EIGENFACES SANS MASQUE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calcul de l'individu moyen :
n = size(X,1);
individu_moyen = mean(X);

% Centrage de la matrice X :
X_centre = X - ones(n,1)*(individu_moyen);

% Calcul de la matrice de covariance (impossible a calculer ainsi a cause de sa taille) :
% Sigma = transpose(X_centre)*X_centre/n;

% Calcul de la matrice resultant du calcul commuté (voir annexe du sujet) :
Sigma2 = (1/n)*X_centre*(X_centre)';

% Calcul des vecteurs/valeurs propres de la matrice Sigma2 :
[Vec_propres_2,Val_propres_2] = eig(Sigma2);

% Les vecteurs propres de Sigma (les eigenfaces) se deduisent de ceux de Sigma2 :
Vec_propres = (X_centre)'*Vec_propres_2;

% Tri par ordre decroissant des valeurs propres de Sigma2 :
[Val_propres, I1] = sort(diag(Val_propres_2), 'descend');

% Tri des eigenfaces dans le meme ordre 
% (on enleve la derniere eigenface, qui appartient au noyau de Sigma) :
valsD = diag(Val_propres_2);
indices_nn_nulle = find(valsD ~= 0);
nv_indices = I1(indices_nn_nulle);
Vec_propores_trie = Vec_propres(:,nv_indices);
% Normalisation des eigenfaces :
W = (Vec_propores_trie)/norm(Vec_propores_trie,2);
% Affichage de l'individu moyen et des eigenfaces sous la forme de "pseudo-images" 
% (leurs coordonnees sont interpretees comme des niveaux de gris) :
figure('Name','Individu moyen et eigenfaces', 'Position', [0,0,0.67*L,0.67*H]);
colormap(gray(256)); 
img = reshape(individu_moyen, nb_lignes, nb_colonnes);
subplot(nb_personnes_base, nb_postures_base, 1)
imagesc(img); 
hold on; 
axis image; 
title(['Individu moyen']);
for k = 1:n-1
	img = reshape(W(:,k), nb_lignes,nb_colonnes);
	subplot(nb_personnes_base, nb_postures_base,k+1);
	imagesc(img); 
	hold on; 
	axis image; 
	title(['Eigenface ', num2str(k)]);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% AVEC MASQUE
%%%%%%%%%%%%%


% Dimensions du masque
% ligne_min = 200;
% ligne_max = 350;
% colonne_min = 60;
% colonne_max = 290;
% 
% %%%%%%%% LECTURE DES DONNES ET AJOUT DU MASQUE
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% X_masque = [];
% 
% figure('Name','Personnes avec Masque','Position',[0,0,0.67*L,0.67*H]);
% colormap(gray(256));
% 
% for j = 1:nb_personnes_base,
%     no_posture = 0;
% 	for k = liste_postures_base,
%         no_posture = no_posture + 1;
%         
%         ficF = strcat('./Data/', liste_personnes_base{j}, liste_postures{k}, '-300x400.gif')
%         img = imread(ficF);
%         
%         % Degradation de l'image
%         img(ligne_min:ligne_max,colonne_min:colonne_max) = 0;
%         % Remplissage de la matrice X_masque :
%         X_masque= [X_masque; double(transpose(img(:)))];
%         
%         % Affichage
% 		subplot(nb_personnes_base, nb_postures_base, (j-1)*nb_postures_base + no_posture);
% 		imagesc(img);
% 		hold on;
% 		axis image;
% 		title(['Personne ' liste_personnes_base{j} ', posture ' num2str(k)]);
%         
% 	end
% end
% 
% %%%%%% REFAIRE LE CALCUL ET L'AFFICHAGE DES EIGENFACES AVEC MASQUE
% 
% % ....
% % les eigenfaces avec masque
% % Calcul de l'individu moyen :
% n2 = size(X_masque,1);
% individu_moyen_masque = mean(X_masque);
% 
% % Centrage de la matrice X :
% X_masque_centre = X_masque - ones(n2,1)*individu_moyen_masque;
% 
% % Calcul de la matrice de covariance (impossible a calculer ainsi a cause de sa taille) :
% % Sigma = transpose(X_centre)*X_centre/n;
% 
% % Calcul de la matrice resultant du calcul commuté (voir annexe du sujet) :
% Sigma2_masque = (1/n2)*X_masque_centre*(X_masque_centre)';
% 
% % Calcul des vecteurs/valeurs propres de la matrice Sigma2 :
% [Vec_propres_masque_2,Val_propres_masque_2] = eig(Sigma2_masque);
% 
% % Les vecteurs propres de Sigma (les eigenfaces) se deduisent de ceux de Sigma2 :
% Vec_propres_masque = (X_masque_centre)'*Vec_propres_masque_2;
% 
% % Tri par ordre decroissant des valeurs propres de Sigma2 :
% [Val_propres_masque, J1] = sort(diag(Val_propres_masque_2), 'descend');
% 
% % Tri des eigenfaces dans le meme ordre 
% % (on enleve la derniere eigenface, qui appartient au noyau de Sigma) :
% valsD_masque = diag(Val_propres_masque_2);
% indices = find(valsD_masque ~= 0);
% nv_indices_2 = J1(indices);
% Vec_propres_masque_trie = Vec_propres_masque(:,nv_indices_2);
% % Normalisation des eigenfaces :
% W_masque = (Vec_propres_masque_trie)/norm(Vec_propres_masque_trie,2);
% % W_masque =
% figure('Name','Individu moyen et eigenfaces', 'Position', [0,0,0.67*L,0.67*H]);
% colormap(gray(256)); 
% img = reshape(individu_moyen, nb_lignes, nb_colonnes);
% subplot(nb_personnes_base, nb_postures_base, 1)
% imagesc(img); 
% hold on; 
% axis image; 
% title(['Individu moyen']);
% for k = 1:n-1
% 	img = reshape(W_masque(:,k), nb_lignes,nb_colonnes);
% 	subplot(nb_personnes_base, nb_postures_base,k+1);
% 	imagesc(img); 
% 	hold on; 
% 	axis image; 
% 	title(['Eigenface ', num2str(k)]);
% end


save eigenfaces;
