function srwt2(n)
hold on;
line([0,0],[0,1]);
line([0,1],[0,0]);
line([1,0],[0,1]);
m=0;
xt=rand();
yt=rand();
if xt+yt>1
    xt=1-xt;
    yt=1-yt;
end
midx=xt/2;
midy=yt/2;
plot(xt,yt);
for a=1:n
    xt=rand();
    yt=rand();
    if xt+yt>1
        xt=1-xt;
        yt=1-yt;
    end
    plot(midx,midy);
    midx=(midx+xt)/2;
    midy=(midy+yt)/2;
end
