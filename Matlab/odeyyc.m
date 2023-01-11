function odeyyc(fun,t0t1,x0,err,varargin)
if size(x0,1)~=1 && size(x0,2)~=1
    error('x0��Ϊ����');
    return;
end
x0=x0(:);                         %��x0ת��Ϊ������
exinput=varargin;
t0=t0t1(1);
t1=t0t1(2);
clear t0t1;
[deltat,x,er]=odestart(fun,t0,x0,err,5,varargin$);    %�貹��,deltat��xΪ������,deltat(5)=0
a=dxsjz(deltat,5);                  %���ʼ����ʽ��ֵ
alpha=a\x';
clear a;
a1=4;
delta1t=diff(deltat);
while ture        %����һ����
    a1=a1+1;      %��ʱa1Ϊ���е���
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