function u2xy=fftlight(txy,u0xy,d,lambda,L)
%txy为屏函数
%u0xy为波前函数
%d为像素点大小
%lambda为波长
%L为屏间距
%输出为复振幅，需平方取绝对值
sz=size(txy);
sz1=[0,0;0,0];
sz1(2,:)=ceil(sz/2);
sz1(1,:)=sz-sz1(2,:);

k0=1/lambda;
dk=1./(sz*d);

a1=0:max(sz(1,1),sz(1,2));
a1=a1.^2;
transmat=repmat([a1((sz1(1,2)+1):-1:2),a1(1:sz1(2,2))],sz(1),1)*(dk(2)^2);
transmat=transmat+repmat([a1((sz1(1,1)+1):-1:2),a1(1:sz1(2,1))],sz(2),1).'*(dk(1)^2);
transmat=exp(i*L*sqrt(k0^2-transmat));

u1xy=u0xy.*txy;
fftu1=fftshift(ifftn(u1xy));
u2xy=fftn(ifftshift(fftu1.*transmat));