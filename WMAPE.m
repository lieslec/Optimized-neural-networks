%CALCULATE OF WMAPE= WEIGHTED MEAN ABSOLUTE PERCENTAGE ERROR
%pred = predicted values
%true = Actual values

function wmape=WMAPE(pred,true)   
h1=(true-pred);
h2= abs(h1./true);               %DIVISIÓN ./
h3= h2.*true;
h4= sum(h3);
h5=sum(true);                    
wmape= h4/h5;
end
