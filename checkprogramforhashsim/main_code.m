clear all
close all
% 'contrast_-20.jpg'
% 'brightness_10.jpg'
% '22.jpg'
sum=0;
for i=1:100
i1=imread('22.jpg');
i1=imresize(i1,[256 256]);
h1=hashcvaleg(i1);
i1=imread('pp.jpg');
i1=imresize(i1,[256 256]);
h2=hashcvaleg(i1);
hx=h1-h2;
    h=norm(hx,2);
    hzz(i)=h;
    sum=sum+hzz(i);
end
sum=sum/100