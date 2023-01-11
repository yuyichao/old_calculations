function y=yfunction(beta)
y=quad(@dydx,-1,0,[1e-5,1e-5],[],beta);

function dydx=dydx(x,beta)
beta=beta*ones(size(x));
dydx=(beta-x.^2)./sqrt((ones(size(x))+beta).^2-(x.^2+beta).^2);