function a=drawline(pic,d)
sz1=size(pic);
if(d<0)
    d=-d;
    pic=pic(sz1(1):-1:1,:);
end
a=zeros(1,sz1(2)+fix(sz1(1)/d));
for i=1:sz1(1)
    a(1+fix(i/d):sz1(2)+fix(i/d))=a(1+fix(i/d):sz1(2)+fix(i/d))+pic(i,:);
end