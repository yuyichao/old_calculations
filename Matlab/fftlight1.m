function u2=fftlight1(u0,t0,d,lambda,L)
u1=u0.*t0;
fftu1=ifftshift(ifft2(u1));
k=2*pi/lambda;
[xm,ym]=size(u0);
ksx=1/(xm*d);
ksy=1/(ym*d);
xmid=ceil(xm/2);
ymid=ceil(ym/2);
kz=zeros(xm,ym);
for a1=drange(1:xm)
    for a2=drange(1:ym)
        kx=ksx*(a1-xmid);
        ky=ksy*(a2-ymid);
        kz(a1,a2)=sqrt(k^2-kx^2-ky^2);
    end
end
transmat=exp(kz*L*1i);
fftu2=transmat.*fftu1;
u2=fft2(fftshift(fftu2));
