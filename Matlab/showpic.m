function showpic(A,b)
%b='black'���Ҷ���ʾ;b='color'��ɫ��ʾ����ǿ����������
%AΪ��ʾǿ�ȵľ���
A=abs(A);
a=max(max(A));
A=A./a;
if(strcmp(b,'color'))
    A=color(A);
end
imshow(A);


function B=color(A)
[m,n]=size(A);
B=zeros(m,n,3);
for i=1:m
    for j=1:n
        if A(i,j)<0.5
            B(i,j,2)=A(i,j);
            B(i,j,3)=0.5-A(i,j);
        else
            B(i,j,2)=1-A(i,j);
            B(i,j,1)=A(i,j)-0.5;
        end
    end
end
B=2*B;