clear all;
close all;

load eigenfaces_masque;

h = figure('Position',[0,0,0.67*L,0.67*H]);
figure('Name','RMSE en fonction du nombre de composantes principales','Position',[0.67*L,0,0.33*L,0.3*L]);

% Calcul de la RMSE entre images originales et images reconstruites :
RMSE_max = 0;

% Composantes principales des données d'apprentissage
C_masque = X_masque_centre*W_masque;

for q = 0:n-1
    Cq_masque = C_masque(:,1:q+1); 	% q premières composantes principales
    Wq_masque = W_masque(:, 1:q+1);		% q premières eigenfaces
    X_masque_reconstruit = Cq_masque*pinv(Wq_masque) + individu_moyen_masque;
    figure(1);
    set(h,'Name',['Utilisation des ' num2str(q) ' premieres composantes principales']);
    colormap gray;
    hold off;
    for k = 1:n
        subplot(nb_personnes_base, nb_postures_base,k);
        img = reshape(X_masque_reconstruit(k,:), nb_lignes, nb_colonnes);
        imagesc(img);
        hold on;
        axis image;
        axis off;
    end
    
    figure(2);
    hold on;

    RMSE_masque = sqrt(mse(X_masque - X_masque_reconstruit));
    RMSE_max = max(RMSE_masque,RMSE_max);

    plot(q,RMSE_masque,'r+','MarkerSize',8,'LineWidth',2);
    axis([0 n-1 0 1.1*RMSE_max]);
    set(gca,'FontSize',20);
    hx = xlabel('$q$','FontSize',30);
    set(hx,'Interpreter','Latex');
    ylabel('RMSE','FontSize',30);
    
    pause(0.01);
end

save projection_masque;
