function picfix=lb(pic, b)
pic=pic(:,:,1);
fp=fft2(pic);
ma=max(max(abs(fp)));
bb=ma/b;
[m,n]=size(pic);
ffix=zeros(m,n);
for i=1:m
    for j=1:n
        if abs(fp(i,j))>bb
            ffix(i,j)=fp(i,j);
        end
    end
end
picfix=ifft2(ffix);
picfix=abs(picfix);
picfix=picfix/max(max(picfix));