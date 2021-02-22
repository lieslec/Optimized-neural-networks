%CALCULATE OF MARIOMETRIC= METRIC OF ERROR
%pred = predicted values
%true = Actual values

function mario = MARIO(pred,true)
k=0.2;
s1=size(pred);
s2=size(true);
err=abs(pred-true);
x=k*err;
if (s1 == s2)
y_aux = (exp(k*x)-exp(-k*x))./(exp(k*x)+exp(-k*x));
mario =sum(y_aux)/s1(1,2);
else
disp('Las dimensiones de los vectores de entrada no son iguales');

end