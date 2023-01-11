function [x,err]=odeplu(f,t0,t1,n,x0,varargin)
t=linspace(t0,t1,n);
x=repmat(x0,1,n);
xx=repmat(x0,1,n);
h=(t1-t0)/(n-1);
x(:,1:4)=odesin(f,t0,t(1,4),4,x0,varargin{:});
xx(:,1:4)=x(:,1:4);
ff=repmat(f(t0,x0,varargin{:}),1,n);
err=repmat(0*x0,1,n);
for i=2:3
    ff(:,i)=f(t(1,i),x(:,i),varargin{:});
end
for i=4:(n-1)
    ff(:,i)=f(t(1,i),x(:,i),varargin{:});
    xx(:,i+1)=x(:,i)+h*(55*ff(:,i)-59*ff(:,i-1)+37*ff(:,i-2)-9*ff(:,i-3))/24;
    x(:,i+1)=x(:,i)+h*(9*f(t(1,i+1),xx(:,i+1),varargin{:})+19*ff(:,i-1)-5*ff(:,i-2)+1*ff(:,i-3))/24;
    err(:,i+1)=(x(:,i+1)-xx(:,i+1))./x(:,i+1);
end

    