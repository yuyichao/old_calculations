function txy=guangshan(xm,ym,d,pre,startl)
if nargin==3
    pre=0.5;
    startl=0;
elseif nargin==4
    startl=0;
end
if isempty(pre)
    pre=0.5;
end
if isempty(startl)
    startl=0;
end
txy=zeros(xm,ym);
for x=drange(1:xm)
    for y=drange(1:ym)
        l=[x,y]*d(:)-startl;
        if l<0
            continue;
        end
        if ceil(l)-l<pre
            txy(x,y)=1;
        end
    end
end