function txy=roundhole(xm,ym,ox,oy, a,b)
if nargin==5
    b=a;
end
txy=zeros(xm,ym);
a02=a^2;
b02=b^2;
for x=1:xm
    for y=1:ym
        if ((x-ox)^2/a02+(y-oy)^2/b02)<=1
            txy(x,y)=1;
        end
    end
end