function srwt1(n,q1,q2,q3)
hold on;
line([0,0],[0,1]);
line([0,1],[0,0]);
line([1,0],[0,1]);
xt=rand();
yt=rand();
if xt+yt>1
    xt=1-xt;
    yt=1-yt;
end
midx=xt*q1;
midy=yt*q1;
plot(xt,yt);
for a=1:n
    m=fix(3*rand());
    switch m
        case {0}
            plot(midx,midy);
            midx=midx*q1;
            midy=midy*q1;
        case {1}
            plot(midx,midy);
            midx=(midx-1)*q2+1;
            midy=midy*q2;
        case {2}
            plot(midx,midy);
            midx=midx*q3;
            midy=(midy-1)*q3+1;
    end
end
