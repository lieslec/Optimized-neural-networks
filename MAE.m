%CALCULATE OF MAE= MEAN ABSOLUTE ERROR
%pred = predicted values
%true = Actual values

function mae=MAE(pred,true)   
h1=abs(true-pred);
h2= sum(h1);    
n=size(h1,2);           %2 = RETURN THE NUMBER OF COLUMNS OF h1.  (1=ROWS AND 2=COLUMNS)
mae=h2*(1/n);                    
end