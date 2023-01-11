function Mu=IPHO391Mu(alpha,a,L,h,b,H,gamma,V0,g,rho,M,GT)
L1=L-h.*cot(gamma);
S0=V0./b;
Turnpoint(1,:,1)=Point1(L1,S0,gamma);
Turnpoint(1,:,2)=Point2(h,S0,gamma);
Turnpoint(1,:,3)=gamma;
if alpha<0
    Mu=0;
    return;
elseif alpha<Turnpoint(1,:,1)
    Mu=Muw1(alpha,a,L1,H,gamma,S0,V0).*rho.*g-M.*g.*GT.*cos(alpha);
elseif alpha<Turnpoint(1,:,2)
    Mu=Muw2(alpha,a,L1,H,gamma,S0,V0).*rho.*g-M.*g.*GT.*cos(alpha);
elseif alpha<Turnpoint(1,:,3)
    Mu=Muw3(alpha,a,L1,L,H,h,gamma,b).*rho.*g-M.*g.*GT.*cos(alpha);
else
    Mu=-M.*g.*GT.*cos(alpha);
end
    
function p1=Point1(L1,S0,gamma)
h1=2*S0./L1;
L2=L1+h1.*cot(gamma);
p1=atan(h1./L2);
return;

function p2=Point2(h,S0,gamma)
l1=2*S0./h;
L3=l1+h.*cot(gamma);
p2=atan(h./L3);
return;    
    
function Muw=Muw1(alpha,a,L1,H,gamma,S0,V0)
A1=(tan(gamma)-tan(alpha))./(tan(gamma)).^2;
B1=2*(1-tan(alpha)./tan(gamma)).*L1;
C1=-L1.^2.*tan(alpha)-2*S0;
D1=B1.^2-4.*A1.*C1;
h2=(-B1+sqrt(D1))./2./A1;
h1=(1-tan(alpha)./tan(gamma)).*h2-L1.*tan(alpha);
L2=L1+h2.*cot(gamma);
S1=h1.*L2;
S2=h2.*L1;
Hc1=(h1+h2)/3;
Hc2=h2/3;
Lc1=L2/3-L1;
Lc2=(L2-2*L1)/3;
Hc=(Hc1.*S1+Hc2.*S2)./(S1+S2);
Lc=(Lc1.*S1+Lc2.*S2)./(S1+S2);
Muw=V0.*((Lc+L1+a).*cos(alpha)-(H-Hc).*sin(alpha));

function Muw=Muw2(alpha,a,L1,H,gamma,S0,V0)
l1=sqrt(2*S0.*(cot(alpha)-cot(gamma)));
l2=sqrt(2*S0./(cot(alpha)-cot(gamma)))./sin(gamma);
Lc=(l2.*cos(gamma)-l1)/3;
Hc=l2.*sin(gamma)/3;
Muw=V0.*((Lc+L1+a).*cos(alpha)-(H-Hc).*sin(alpha));

function Muw=Muw3(alpha,a,L1,L,H,h,gamma,b)
l1=h.*(cot(alpha)-cot(gamma));
Lc=(L-L1-l1)/3;
Hc=h/3;
S=l1.*h/2;
V=S.*b;
Muw=V.*((Lc+L1+a).*cos(alpha)-(H-Hc).*sin(alpha));
