function picf=fixpic(pic,m)
[a,b]=size(pic);
picf=zeros(a,b);
for i=1:a
    for j=1:b
        if abs(pic(i,j))>m
            picf(i,j)=pic(i,j);
        end
    end
end