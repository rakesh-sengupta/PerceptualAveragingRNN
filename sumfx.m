function [result]=sumfx(x,N)
x(find(x<=0))=0;
result=(x./(1+x));
%result=1./(1+exp(-x));
%result=(x.^2);
return