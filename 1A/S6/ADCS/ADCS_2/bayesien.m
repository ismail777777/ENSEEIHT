%BAYESIEN : Identification de la personne (personne et sa posture) la plus
%vraisembable de la représentation compacte d'une image requète en
%utilisant la classification bayésienne
% DONNEES :
%       BaseApp : La base d'apprentissage des personnes et des postures
%       (c'est la base des représentations compactes des images)
%       Requete : L'image requete qu'on veut classifier
%       Nb_personnes : le nombre de personnes dans la base d'apprentissage
%       Nb_postures : le nombre de postures dans la base d'apprentissage
%
% RESULTATS :
%       PersonneEstime : le numéro de la personne dans la base
%       d'apprentissage dont la représentation compacte est la plus 
%       vraisembable à la représentation compacte de l'image requete
%       PostureEstime : le numéro de la posture de la PersonneEstime

function [PersonneEstime, PostureEstime] = bayesien(BaseApp, Requete, Nb_personnes, Nb_postures)
    Nb_donnees = Nb_personnes*Nb_postures; %Le nombre d'images dans la base d'apprentissage

    %ESTIMATION DE LA PERSONNE
    Liste_Personnes = []; %La liste où on insere la vraisemblance de chaque individu, donc elle aurea Nb_personnes valeurs p_Cx
    i = 1;
    while i <= Nb_donnees
        %Estimation de mu et sigma de tous les images du même individu (on
        %prend tous les postures de cet individu)
        [mu_i sigma_i] = estimation_mu_sigma(BaseApp(i:i+Nb_postures-1, :));
        %Calcul de la vraisemblance de l'individu
        p_Cx_i = norm(gaussienne(Requete, mu_i, sigma_i));
        %Attention : reçu résultat Inf faux et parfois imaginaire
        if p_Cx_i == Inf 
            p_Cx_i = 0;
        end
        %Inserer la vraisemblance calculé
        Liste_Personnes = [Liste_Personnes p_Cx_i];
        %Passons à l'individu prochain
        i = i + Nb_postures;
    end
    %Trions les vraisemblances obtenus :
    [Liste_Personnes_triees indices_Personnes] = sort(Liste_Personnes, 'descend');
    %La personne estime c'est la personne qui maximise la vraisemblance donc :
    PersonneEstime = indices_Personnes(1);

    %ESTIMATION POSTURE
    %Il s'agit de refaire le même travail avec la vraisemblance mais ici
    %par groupes de postures mais pas qu'avec ceux de la personne estime
    % sinon les Sigmas sont nuls
    Liste_Postures = [];
    %La position de la première posture de la personne estime dans la
    %matrice de la base d'apprentissage
    
    for k = 1:Nb_postures
       [mu_i, sigma_i] = estimation_mu_sigma(BaseApp(k:Nb_personnes:Nb_donnees, :));
       P_Cx_wi = norm(gaussienne(Requete, mu_i, sigma_i));
       if P_Cx_wi == Inf 
            P_Cx_wi = 0;
       end
       Liste_Postures = [Liste_Postures P_Cx_wi];
    end
    %Trions les vraisemblances 
    [Liste_Postures_triees indices_Postures] = sort(Liste_Postures, 'descend');
    %La posture estime est la posture qui maximise la vraisemblance donc :
    PostureEstime = indices_Postures(1);
end