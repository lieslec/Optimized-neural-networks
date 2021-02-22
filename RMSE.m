%CALCULATE OF RMSE= ROOT MEAN SQUARE ERROR
%pred = predicted values
%true = Actual values

function rmse=RMSE(pred,true)   
h1=(true-pred);
h2= h1.^2;              
h3= sum(h2);
n=size(h2,2);           %2 = RETURN THE NUMBER OF COLUMNS OF h1.  (1=ROWS AND 2=COLUMNS)
h4=h3*(1/n);                    
rmse= sqrt(h4);
end
