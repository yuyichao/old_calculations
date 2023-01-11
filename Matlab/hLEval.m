%matlabpool

kappa = [4 1 5 ; 2 4 6 ; 8 7 10 ; 4 7 8]';
L = 30;
k_len = size(kappa,2);

tnum = 100;

h = zeros(tnum,k_len);

parfor i1 = 1 : tnum
    tic
    h(i1,:) = heval(L,kappa);
    display(int2str(i1))
    toc
end

h_diff = h - repmat(sum(h,1)/tnum,tnum,1);

hL = sum(prod(sqrt(pi)*h_diff,2))/tnum;

%save hL2