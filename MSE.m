%CALCULATE OF MSE= MEAN SQUARED ERROR
%pred = predicted values
%true = Actual values

function mse=MSE(pred,true)   
h1=(true-pred);
h2= h1.^2;              
h3= sum(h2);
n=size(h2,2);           %2 = RETURN THE NUMBER OF COLUMNS OF h1.  (1=ROWS AND 2=COLUMNS)
mse=h3*(1/n);                    
end
