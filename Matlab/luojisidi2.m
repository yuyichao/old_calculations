function luojisidi2(a,d,g,h)%luojisidi2(a,d,g,h):: a:迭代次数；d:alpha间隔；
%g,h:alpha始末值
set(0, 'DefaultlineMarkerSize', 0.01);
e=1:0;
f=1:0;
for alpha=linspace(g,h,d);
    b=zeros(1,a);
    for n=1:a
        if n==1
            b(1,n)=0.5;
        else
            b(1,n)=alpha*b(1,n-1)*(1-b(1,n-1));
        end
    end
    %b=fft(b);
    f=[f,b(1,0.9*a:a)];
    e=[e,repmat(alpha,1,(size(f,2)-size(e,2)))];
end
plot(e,f,'b. ');
clear a d g h e f alpha b n;