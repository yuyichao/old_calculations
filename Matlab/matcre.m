function a=matcre(fun,varargin)
xm=varargin;
n=nargin-1;
if n==1
    xn={1,xm{:}};
else
    xn=xm;
end
x=repmat({[1]},size(xm));
a=zeros(xn{:});
while true
    if isempty(x)
        break;
    end
    a(x{:})=fun(x{:});
    n1=1;
    while true
        if x{n1}>=xm{n1}
            x{n1}=1;
            n1=n1+1;
            if n1>=n+1
                x=[];
                break;
            end
        else
            x{n1}=x{n1}+1;
            break;
        end
    end
end