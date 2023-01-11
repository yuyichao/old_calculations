function a=temp()
b=1;
a=zeros(1,100000);
a(1)=2;
for i=3:1000000
    a(b+1)=i;
    b=b+1;
    for j=0:(b-2)
        if fix(i/a(j+1))*a(j+1)==i
                b=b-1;
                break;
        end
    end
end