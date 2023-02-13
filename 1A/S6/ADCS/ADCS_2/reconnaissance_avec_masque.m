clear;
close all;

load eigenfaces_part3;

% Tirage aléatoire d'une image de test :
personne = randi(nb_personnes)
posture = randi(nb_postures)
% si on veut tester/mettre au point, on fixe l'individu
%personne = 10
%posture = 6

% Dimensions du masque
ligne_min = 200;
ligne_max = 350;
colonne_min = 60;
colonne_max = 290;

ficF = strcat('./Data/', liste_personnes{personne}, liste_postures{posture}, '-300x400.gif')
img = imread(ficF);
img(ligne_min:ligne_max,colonne_min:colonne_max) = 0;
image_test = double(transpose(img(:)));
 


% Nombre q de composantes principales à prendre en compte 
% q = 2;

% dans un second temps, q peut être calculé afin d'atteindre le pourcentage
% d'information avec q valeurs propres (contraste)
% Pourcentage d'information 
% per = 0.75;

%...
q = 15;
DataA_masque = X_masque*W_masque(:,1:q);
LabelA = liste_base;
image_test = double(transpose(img(:)));
DataT_masque = image_test*W_masque(:,1:q);
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
imagesc(img);
title({['Individu de test : posture ' num2str(posture) ' de ', liste_personnes{personne}]}, 'FontSize', 20);
axis image;

        
subplot(1, 2, 2);
imagesc(img_res);
title({['Individu la plus proche ']}, 'FontSize', 20);
axis image;

confusion = confusionmat(img(:), img_res(:))
