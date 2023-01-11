function ff=pdiff1(f,n,er,varargin)
format long;
[m,k]=size(varargin{n});
ff=zeros(m,k);
h=0.01;
if er==0
    er=h/10;
end
for a=1:m
    for b=1:k
        d1=[];
        d2=[];
        while true
            h=h/20;
            if size(d1,1)~=0
                if max(abs(d1-d2))<=er/10
                    break;
                elseif isnan(d1-d2)
                    if d1~=inf
                        d1=nan;
                    end
                    break;
                end
                d2=d1;
            end
            c=repmat(varargin,2,1);
            c{2,n}(a,b)=c{1,n}(a,b)-h;
            if c{2,n}(a,b)==c{1,n}(a,b)
                break;
            elseif h<abs(c{1,n}(a,b))*10^-10
                break;
            end
            d1=(f(c{1,:})-f(c{2,:}))/h;
        end
        ff(a,b)=d1;
    end
end
