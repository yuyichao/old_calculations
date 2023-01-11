function [t,m,k] = randseq(n,T)

len = n*(n+1)/2;
t0 = 1/len;

dt = - t0 * log(rand([1 floor(len/2)]));
t = cumsum(dt);
tmax = t(length(t));

while tmax < T
    dt = - t0 * log(rand([1 floor(len/2)]));
    t = [t tmax+cumsum(dt)];
    tmax = t(length(t));
end

t = t(1:sum(t<T));

% t = [];
% t1 = - t0 * log(rand());
% while t1 < T
%    t = [t t1];
%    t1 = t1 - t0 * log(rand());
% end

s = size(t);

m = randi(n,s);
k = randi(n+1,s);
sw = (k>m);
m = m + sw.*(n+1-2*m);
k = k + sw.*(n+2-2*k);

end