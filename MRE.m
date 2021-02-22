%CALCULATE OF MRE= MEAN RELATIVE ERROR
%pred = predicted values
%true = Actual values

function mre=MRE(pred,true)   
h1=abs(true-pred);
h2=(h1./true);               %DIVISIÓN ./
h3=sum(h2);
n=size(h1,2);                    %2 = RETURN THE NUMBER OF COLUMNS OF h1.  (1=ROWS AND 2=COLUMNS)
h4= (1/n)*h3;
mre=h4*100;
end