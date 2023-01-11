function [a,v]=randdet(m,d)
a=fix(rand(d,d)*m+1);
v=fix(det(a));