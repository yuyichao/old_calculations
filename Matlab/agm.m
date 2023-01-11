function [an,bn]=agm(a,b,n)
an=zeros(1,n+1);
bn=zeros(1,n+1);
for i = 1:n
    an(i)=a;
    bn(i)=b;
    a=(a+b)/2;
    b=sqrt(an(i)*bn(i));
end
an(n+1)=a;
bn(n+1)=b;