function y=polysval(alpha,x0)
alpha=alpha(:)';
x=ones(size(alpha));
for a1=2:size(alpha,2)
    x(a1)=x(a1-1)*x0;
end
y=x.*alpha;