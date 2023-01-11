function t=point(d,m,lambda,f,h)
t=zeros(m,m);
mid=m/2;
for a1=1:m
    for a2=1:m
        temp=((a1-mid)^2+(a2-mid)^2+(f/d)^2)^.5*d;
        t(a1,a2)=1/temp*exp(h*i*2*pi/lambda*temp);
    end
end
