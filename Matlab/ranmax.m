function ma=ranmax(dim,n)
ma=0;
for m=1:n
    a=fix(2*(rand(dim)));
    b=ma;
    c=abs(det(a));
    ma=max(b,c);
end