function res = tempfun(x,v,c,w,n,a)
    res = (x - v * c) / (1 + v) - w * (n - x) / a / x + a * x / (n - x);