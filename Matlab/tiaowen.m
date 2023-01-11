function a=tiaowen(d,eta)
a=zeros(1000,1000);
ran=rand(1004);
for b=1:1000
   for c=1:1000
       ran2=0;
       for f=-2:2
           for e=-2:2
               ran2=ran2+ran(b+f+2,c+e+2);
           end
       end
       a(b,c)=(1+eta*cos(2*pi*b/d))^2*ran2/25;
   end
end