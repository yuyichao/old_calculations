function [q,p,err]=smih(ha,t0,t1,q0,p0,n)
q0=q0(:);
p0=p0(:);
[qp,err]=odeplu(@hadt,t0,t1,n,[q0;p0],(t1-t0)/(n-1),ha);
a=size(qp,1)/2;
q=qp(1:a,:);
p=qp((a+1):(2*a),:);
plot(q(1,:)',q(2,:)');
%plot(q(1,:)');
hold on;
%plot(q(2,:)');
%plot(q(3,:)');
%hold off;