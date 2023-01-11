function t=toujing(xm,ym,xo,yo,d,f,lambda)
a1=max([xm-xo,xo,ym-yo,yo]);
a2=d*(0:a1).^2;
k=2*pi/lambda;
a3=repmat([a2(xo:-1:1),a2(2:(xm-xo+1))],ym,1)+repmat([a2(yo:-1:1),a2(2:(ym-yo+1))],xm,1)';
t=exp(-i*k*a3/(2*f));