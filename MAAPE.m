%CALCULATE OF MAAPE= MEAN ARCTANGENT ABSOLUTE PERCENTAGE ERROR
%pred = predicted values
%true = Actual values

function maape=MAAPE(pred,true)   
h1=(true-pred);
h2= abs(h1./true);               %DIVISIÓN ./
h3=atan(h2);                     %ARCOTANGENTE OF h2
h4= sum(h3);
n=size(h1,2);                    %2 = RETURN THE NUMBER OF COLUMNS OF h1.  (1=ROWS AND 2=COLUMNS)
maape= (1/n)*h4;
end