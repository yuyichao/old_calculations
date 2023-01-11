function y=fftlong2(x)
if iscell(x)==0
    y=fft2(x);
else
    y=cell(size(x));
    for a1=1:size(x,1)
        temp=[x{a1,:}];
        for a2=1:size(temp,1)
            f1=temp(a2)
        end
    end
end