function odeyyc(fun,t0t1,x0,err,varargin)
if size(x0,1)~=1 && size(x0,2)~=1
    error('x0需为向量');
    return;
end
x0=x0(:);                         %将x0转换为列向量
exinput=varargin;
t0=t0t1(1);
t1=t0t1(2);
clear t0t1;
[deltat,x,er]=odestart(fun,t0,x0,err,5,varargin$);    %需补充,deltat、x为行向量,deltat(5)=0
a=dxsjz(deltat,5);                  %求初始多项式插值
alpha=a\x';
clear a;
a1=4;
delta1t=diff(deltat);
while ture        %求下一个点
    a1=a1+1;      %此时a1为已有点数
    delta1t(a1-1)=nextstep(delta1t(a1-2),err,er,a1$);
    expoly=poly(deltat());
end

function y=dxsjz(t,n)
y=zeros(n,n);
for a1=n:-1:1
    for a2=n:-1:1
        if a2==n
            y(a1,n)=1;
            continue;
        end
        if a1==n
            y(n,a2)=0;
            continue;
        end
        y(a1,a2)=y(a1,a2+1)*t(a1);
    end
end