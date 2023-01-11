
T = 25;
n = 100;

xmk = zeros(n)+Inf;

for i1 = 1 : n
    for i2 = 1 : i1
        xmk(i1,i2) = i2-i1-1;
    end
end

[t,m,k] = randseq(n,T);

for i1 = 1 : length(t)
    m1 = m(i1);
    k1 = k(i1);
    xmk1 = xmk(m1,k1);
    if (m1>1) && (xmk1 == xmk(m1-1,k1) - 1)
        continue
    end
    
    while (m1 <= n) && (xmk(m1,k1) == xmk1)
        xmk(m1,k1) = xmk(m1,k1) + 1;
        m1 = m1 + 1;
        k1 = k1 + 1;
    end
    
end

y = repmat((1:n)',[1,n]);
figure
scatter(reshape(xmk,[1,n^2]),reshape(y,[1,n^2]),'k.')
axis equal

x = zeros(n);
for i1 = 1 : n
    x(i1,:) = circshift(xmk(i1,:),[0,-i1]);
end
figure
plot(x,y,'k')
axis equal