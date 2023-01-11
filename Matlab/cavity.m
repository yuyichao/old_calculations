function list = cavity(L, f1, f2, n, x0)
    list = zeros(1, n);
    list(1) = x0;
    d = L / 2;
    for i = 2:n
        list(i) = next(list(i - 1), d, f1, f2);
    end


function v = uv(u, f)
    v = f * u/(u - f);


function xp = next(x, d, f1, f2)
    u1 = d - x;
    v1 = uv(u1, f1);
    u2 = 2 * d - v1;
    v2 = uv(u2, f2);
    xp = v2 - d;
