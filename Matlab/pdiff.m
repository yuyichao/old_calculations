function ff=pdiff(f,n,h,varargin)
[m,k]=size(varargin{n});
ff=zeros(m,k);
for a=1:m
    for b=1:k
        h=h/20;
        c=repmat(varargin,5,1);
        for i=2:5
            c{i,n}(a,b)=c{i-1,n}(a,b)-h;
        end
        ff(a,b)=(25*f(c{1,:})-48*f(c{2,:})+36*f(c{3,:})-16*f(c{4,:})+3*f(c{5,:}))/(12*h);
    end
end
