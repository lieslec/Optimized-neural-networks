function salida=aleatoriza(matriz)
[fil,col]=size(matriz)

salida=zeros(fil,col);
pos=randperm(fil,fil);

for i=1:fil
   
    salida(pos(i),:)=matriz(i,:);
    
    
end


end
