function plotfunction(fun,xmin,xmax,n,varargin)
x=linspace(xmin,xmax,n);
y=zeros(1,n);
for a=1:n;
    y(a)=fun(x(a),varargin{:});
end
plot(x,y);