function osc(delta,n)
a=zeros(1,n);
a(1)=2-delta;
for i=2:n
    a(i)=a(1)-1/a(i-1);
end
plot(a);