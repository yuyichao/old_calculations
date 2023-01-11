function fminp(f,h,err,nmax,varargin)
input=varargin;
f0=f(input{:});
f00=f0;
f1=[];
deltain=cell(nargin);
n2=0;
location=[];
while ifend(f00,f1,err,n2,nmax)
    n2=n2+1;
    f00=f0;
    
    while true
        [input,location,yes]=nextin(input,location,h);
        if yes
            break;
        end
        f1=f(input{:});
        [input,deltain]=nextstep(input,deltain);
    end
    
end