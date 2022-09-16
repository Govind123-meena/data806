clear all
close all
sum=0;
for i=1:5
i1=imread('original.jpg');
i1=im2double(i1);
h1=hashcvaleg(i1);
i1=imread('contrsat_20.jpg');
i1=im2double(i1);
h2=hashcvaleg(i1);
hx=h1-h2;
    h=norm(hx,2);
    hzz(i)=h;
    sum=sum+hzz(i);
    
end
sum=sum/100;
