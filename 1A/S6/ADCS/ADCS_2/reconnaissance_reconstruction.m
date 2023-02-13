clear;
close all;

load eigenfaces_part3;

% Tirage aléatoire d'une image de test :
personne = randi(nb_personnes)
posture = randi(nb_postures)
% si on veut tester/mettre au point, on fixe l'individu
%personne = 10
%posture = 6
%Taille masque
ligne_min = 200;
ligne_max= 350;
colonne_min = 60;
colonne_max = 290;

ficF = strcat('./Data/', liste_personnes{personne}, liste_postures{posture}, '-300x400.gif')
img = imread(ficF);
img(ligne_min:ligne_max,colonne_min:colonne_max) = 0;
 



 

% dans un second temps, q peut être calculé afin d'atteindre le pourcentage
% d'information avec q valeurs propres (contraste)
% Pourcentage d'information 
per = 0.75;

% Nombre q de composantes principales à prendre en compte 
q = floor(15*per);
DataA = X_masque*W(:,1:q);
LabelA = liste_base;
image_test = double(transpose(img(:)));
DataT = image_test*W(:,1:q);
%methode kppv
[rep_compactes, label_individus] = kppv(DataA, LabelA, DataT, 1, 1)
%label_individus
%[label_individus] = bayesien(DataA, DataT);
% individu pseudo-résultat pour l'affichage (A CHANGER)
personne_proche = 1;
posture_proche = 1;
ficF_res = label_individus(1,:);
img_res = imread(ficF_res);


%matrice de confusion
confusion = confusionmat(image_test, double(transpose(img_res(:))));
figure('Name','Image tiree aleatoirement','Position',[0.2*L,0.2*H,0.8*L,0.5*H]);

subplot(1, 2, 1);
% Affichage de l'image de test :
colormap gray;
imagesc(img);
title({['Individu de test : posture ' num2str(posture) ' de ', liste_personnes{personne}]}, 'FontSize', 20);
axis image;

img(ligne_min:ligne_max,colonne_min:colonne_max) = img_res(ligne_min:ligne_max,colonne_min:colonne_max);
subplot(1, 2, 2);
imagesc(img);
title('Image reconstruite' , 'FontSize', 20);
axis image;
