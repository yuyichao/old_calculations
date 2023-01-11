function [Z, F] = ZF(lambda, R, L, d, n, w5)
z0 = L / 2;
a0 = sqrt(z0 / (R - z0));
s0 = lambda * z0 / a0;
w0 = sqrt(s0 / pi);
w = w0 * sqrt(1 + a0 ^ 2);
a1 = a0 * n;
w1 = w / sqrt(1 + a1 ^ 2);
z1 = R / (1 + a1 ^ -2);
z2 = z1 + d;
a2 = lambda * z2 / (n * pi * w1 ^ 2);
w2 = w1 * sqrt(1 + a2 ^ 2);
R2 = z2 * (1 + a2 ^ -2);
w3 = w2;
R3 = R2 / n;
a3 = pi * w3 ^ 2 / (lambda * R3);
w4 = w3 / sqrt(1 + a3 ^ 2);
z4 = R3 / (1 + a3 ^ -2);
F = pi * w4 / lambda * sqrt(w5 ^ 2 - w4 ^ 2);
Z = F - z4;
w0
w4
w
w1
w2