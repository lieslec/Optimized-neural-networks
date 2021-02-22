%CALCULATE OF MAPE= MEAN ABSOLUTE PERCENTAGE ERROR
%pred = predicted values
%true = Actual values

function mape=MAPE(pred,true)   
h1=(true-pred);
h2= abs(h1./true);               %DIVISIÓN ./
h3= sum(h2);
n=size(h1,2);                    %2 = RETURN THE NUMBER OF COLUMNS OF h1.  (1=ROWS AND 2=COLUMNS)
mape= (1/n)*h3;
end
