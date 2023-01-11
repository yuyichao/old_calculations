function luojisidi(a,alpha)
b=zeros(1,a);
c=0:(1/(a-1)):1;
for n=1:a
    if n==1
        b(1,n)=0.5;
    else
        b(1,n)=alpha*b(1,n-1)*(1-b(1,n-1));
    end
end
%b=fft(b);
set(0, 'DefaultlineMarkerSize', 0.01);
plot(c,b,'b. ');
clear a alpha b c n;