d=0.001:0.001:100;
e=size(d,2);
c=1:e;
h=zeros(1,e);
for b=c
    h(b)=d(b)*1.2*10^-13;
while 1
    a=h(b)+b-b;
    if a==0
        break;
    end
    h(b)=h(b)*0.999;
end
end
set(0, 'DefaultlineMarkerSize', 0.01);
plot(d,h,'b. ',d,50*h./d,'r. ');
