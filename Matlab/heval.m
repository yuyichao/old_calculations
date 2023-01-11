function h = heval(L,kappa)

nu  = kappa(1,:);
eta = kappa(2,:);
tau = kappa(3,:);

k_len = length(tau);

ti = L*tau;
ni = floor(L*eta);
xi = floor(L*(nu-eta)) + 0.5;

T = max(ti);
n = max(ni);

k_sorted = sortrows([1:k_len ; ti ; ni ; xi]',2)';
k_ord = k_sorted(1,:);
ti = k_sorted(2,:);
ni = k_sorted(3,:);
xi = k_sorted(4,:);

hi = zeros(1,k_len);
k_cur = 1;

xmk = zeros(n)+Inf;

for i1 = 1 : n
    for i2 = 1 : i1
        xmk(i1,i2) = i2-i1-1;
    end
end

[t,m,k] = randseq(n,T);

for i1 = 1 : length(t)
    t1 = t(i1);
    
    while t1 > ti(k_cur) && k_cur <= k_len
% y = repmat((1:n)',[1,n]);
% figure
% scatter(reshape(xmk,[1,n^2]),reshape(y,[1,n^2]),'k.')
% axis equal
        hi(k_cur) = hfunc(xmk,xi(k_cur),ni(k_cur));
        k_cur = k_cur + 1;
    end
    
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

while k_cur <= k_len
% y = repmat((1:n)',[1,n]);
% figure
% scatter(reshape(xmk,[1,n^2]),reshape(y,[1,n^2]),'k.')
% axis equal
    hi(k_cur) = hfunc(xmk,xi(k_cur),ni(k_cur));
    k_cur = k_cur + 1;
end

hi = sortrows([hi ; k_ord]',2)';

h = hi(1,:);

end

function h = hfunc(xmk,xi,ni)

h = sum(xmk(ni,1:ni)>xi);

end