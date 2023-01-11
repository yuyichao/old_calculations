function hadt=hadt(t,qp,m,ha)
a=size(qp,1)/2;
hadt=[dcoord(ha,qp(1:a,1),qp((a+1):(2*a),1),t,m);dmomentum(ha,qp(1:a,1),qp((a+1):(2*a),1),t,m)];

function dcoord=dcoord(ha,q,p,t,h)
dcoord=pdiff(ha,2,h,q,p,t);

function dmomentum=dmomentum(ha,q,p,t,h)
dmomentum=-pdiff(ha,1,h,q,p,t);