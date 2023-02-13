%--------------------------------------------------------------------------
% ENSEEIHT - 1SN - Analyse de donnees
%
% Données :
% DataA      : les données d'apprentissage (connues)
% LabelA     : les labels des données d'apprentissage
%
% DataT      : les données de test (on veut trouver leur label)
% Nt_test    : nombre de données tests qu'on veut labelliser
%
% K          : le K de l'algorithme des k-plus-proches-voisins
%
% Résultat :
% rep_compactes : L'ensemble des images compactes des
% resultats
% label_individus             : labels des individus resultats
%--------------------------------------------------------------------------
function [ individus] = kppv(DataA, LabelA, DataT, Nt_test, k)
for i = 1:Nt_test
    M = DataA - DataT(i,:);
    D = sqrt(sum(M.*M,2));
    
    [~, I] = sort(D, "ascend");
    classes = LabelA(I,:);
    classes = classes(1 : k,:);
    individus = classes;
end


