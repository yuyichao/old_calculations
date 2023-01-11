function [problist,out]=randomwalk(step,prob)
problist=zeros(1,step+2);
problist1=zeros(1,step+2);
problist(1)=1;
a=(1-prob)*prob;
b=(1-prob)^2;
c=prob^2;
out=0;
for i=1:step
    out=out+problist(1)*(1-prob);
    problist1(1)=problist(1)*a+problist(2)*b;
    for j=2:(i+1)
        problist1(j)=2*problist(j)*a+problist(j+1)*b+problist(j-1)*c;
    end
    problist=problist1;
end