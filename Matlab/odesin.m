function x=odesin(f,t0,t1,n,x0,varargin)
t=linspace(t0,t1,n);
x=repmat(x0,1,n);
h=(t1-t0)/(n-1);
for i=1:(n-1)
    k1=h.*f(t(1,i),x(:,i),varargin{:});
    k2=h.*f(t(1,i)+h/2,x(:,i)+k1/2,varargin{:});
    k3=h.*f(t(1,i)+h/2,x(:,i)+k2/2,varargin{:});
    k4=h.*f(t(1,i)+h,x(:,i)+k3,varargin{:});
    x(:,i+1)=x(:,i)+(k1+2*k2+2*k3+k4)./6;
end