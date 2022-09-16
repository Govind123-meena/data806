clear all
close all
sum=0;
for i=1:100
i1=imread('original.jpg');
h1=hash_value(i1);
i1=imread('s2.jpg');
h2=hash_value(i1);
hx=h1-h2;
    h=norm(hx,2);
    hzz(i)=h;
    sum=sum+hzz(i);
end
sum=sum/100;