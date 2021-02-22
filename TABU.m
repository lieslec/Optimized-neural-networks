%CALCULA MINIMO CON TABU
%matriz = matriz de valores
%paso = pasos recorridos para definir la vecindad
%parada= criterio de parada (valor del error permitido)

function [iter,e,f,c]=TABU(M,Criterio_parada,Menor,fil_ini,col_ini) 
%fil_ini = 4
%col_ini = 18
iter = 2;
f=zeros(1,40);
c=zeros(1,40);
e=ones(1,40);
%Busca el n�mero mayor en el vecindario
while (Menor > Criterio_parada && iter <40)
A=gen_M(M,fil_ini,col_ini);
[Menor,I] = min(A(:)); % coloca toda la matriz como un vector columna y selecciona el menor n�mero
[I_row, I_col] = ind2sub(size(A),I);  %Entrega las coordenadas del n�mero menor identificado
fil_ini=fil_ini+I_row-2; %Hace la correccion de posicion relativa a abosoluta
col_ini=col_ini+I_col-2; %Hace la correccion de posicion relativa a abosoluta
f(iter)=fil_ini; %guarda las coordenadas para tener trazabilidad de los puntos
c(iter)=col_ini;
e(iter)=Menor;
%### Este código que sigue es quien configura el comportamiento de Tabu
if ((fil_ini-f(iter-1))==0 && (col_ini-c(iter))==0)

M(fil_ini,col_ini)=1000;

else
	iter = iter +1;

end


end
e(iter:40)=NaN %aqui se arregla sumano o no +1 a iter, cuando no sale el ultimo numero osea el minimo global

end
