function [predichos,reales,RAEO,RR,MAPEO, R2O,MSEO, RMSEO,MAEO, MREO, MAAPEO, WMAPEO, MARIOO]=validacion(input_set,target_set,j,x1,x2) %input_set y target_set debo entregarlo transpuesto y aleatorizado
%function [predichos,reales,target,inputs, RAEO,RR,MAPEO, R2O,MSEO, RMSEO,MAEO, MREO, MAAPEO, WMAPEO, MARIOO]=validacion(input_set,target_set,j,x1,x2)
%[training_set,validation_set,targets_tr,targets_val,RAEM,RM]=validacion(input_set,target_set,j)
%%[Tr,V,targ,tarval,RAE,R]=validacion(inputs,targets,10,27)%%
[fil,col]=size(input_set);
%[fil1,col1]=size(target_set);

n=floor(col/j);


for k=1:j
    cc=1;
    for i=((k-1)*n)+1:n*k
        set_seg(:,cc,k)=input_set(:,i);
        tar_seg(:,cc,k)=target_set(:,i);
        cc=cc+1;
    end
end

vector=1:j;

for i=1:j
  % i=2;
    vector1=vector;
    aux=vector(i);
    vector1(i)=0;
    flag=1;
    for o=1:j

        if vector1(o)~=0
            
            if flag==1
                g=set_seg(:,:,vector1(o))';
                h=tar_seg(:,:,vector1(o))';
                flag=0;
            
            else
            g=vertcat(g,set_seg(:,:,vector1(o))');
            h=vertcat(h,tar_seg(:,:,vector1(o))');
        
            end
            
            
        end
       
    end

 training_set=g;
 validation_set=set_seg(:,:,aux)';
 targets_tr=h;
 targets_val=tar_seg(:,:,aux)';
  
net=newff(training_set',targets_tr',[x1 x2]);
net.trainFcn='trainbr';                     %Bayesian regularization is the training algorithm selected
net=train(net,training_set',targets_tr');   %training to generate a neural network
y=net(validation_set');                     %predichos using the neural network 

%METRICS IN EACH CICLE i x 10 folds
RAEO(i)=RAE(y, targets_val');               %CÁLCULO DE RAE 
R=corrcoef(y, targets_val');                %CORRELATION COEFFICIENT
RR(i)=R(1,2);                               %corrcoef ENTREGA UN VECTOR Y R ES EL UBICADO EN LA POSICIÓN (1,2)
MAPEO(i)=MAPE(y, targets_val');             %MEAN ABSOLUTE PERCENTAGE ERROR
R2O(i)= R(1,2)*R(1,2);                      %SQUARE CORRELATION COEFFICIENT
MSEO(i)=MSE(y, targets_val');               %MEAN SQUARED ERROR
RMSEO(i)=RMSE(y, targets_val');             %ROOT MEAN SQUARE ERROR
MAEO(i)=MAE(y, targets_val');               %MEAN ABSOLUTE ERROR
MREO(i)=MRE(y, targets_val');               %MEAN RELATIVE ERROR
MAAPEO(i)=MAAPE(y, targets_val');           %MEAN ARCTANGENT ABSOLUTE PERCENTAGE ERROR
WMAPEO(i)=WMAPE(y, targets_val');           %WEIGHTED MEAN ABSOLUTE PERCENTAGE ERROR
MARIOO(i)=MARIO(y, targets_val');           %MARIO METRIC   

%TOTAL PREDICTED AND REAL VALUES CALCULATED
predichos(i,:) = y;                         %predichos in each cicle which are used to valid
reales(i,:) = targets_val';                 %reales shows the actual values which are used to valid

%TOTAL VALUES ORGANIZED
target(i,:)=targets_tr';                    %target shows the differents outputs to train in each cicle (are j different training)
inputs(:,:,i) = training_set';              %inputs shows the differents inputs to train in each cicle(are j different training)

end



end































