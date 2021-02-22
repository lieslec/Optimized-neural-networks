
z=1000*ones(22,22);
z(2:21,2:21) = RAEE;  %AQUI CAMBIAR LA DATA
Criterio_parada= 0.0542  %3.4 powerplant %1.892 RMSE_CONCRET   %0.026 RW_RAE %0.0331RWWSB_RAE %0.0542RAE_Q_l  %0.24 WINE_MAE  
Menor = 10

for i=1:1 % el limite de este for son los restarts
fil_ini= unidrnd(20,1,1)+1  % genera 1 vector de 10 elementos de valores [2-21]
col_ini= unidrnd(20,1,1)+1  % genera 1 vector de 10 elementos de valores [2-21]
[iter,e,f,c]=TABU(z,Criterio_parada,Menor,fil_ini,col_ini);
end
figure(2)
hold on
grid on
xlabel('Iteration') 
ylabel('RAE values')
plot([0:iter-2],e(2:iter),'b','linewidth',3)
%legend ('Hill Climbing Random Restart', 'Tabu List')%('Wine quality')%('Power plant'),'Concrete compressive strength') %('Exploration RW', 'Exploration RW WSB', 'Exploration Q Learning') 

