%CALCULATE OF RAE ABSOLUTE RELATIVE ERROR
%pred = predicted values
%true = Actual values

function rae=RAE(pred,true) 
h1=abs(true-pred);
h2=abs(mean(true)-true);
HA1=sum(h1);
HA2=sum(h2);
rae=HA1/HA2;
end
