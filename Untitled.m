clc;
clear all;
cd 'F:\bxx'
im1=imread('3d.jpg');
cd 'F:\bxx\files'
nh=[];
files=dir('*.jpg');
x=[1 2]
for file=files'
    im2=imread(file.name);
    im2=imresize(im2,[256 256]);
    im2=im2double(im2);
    disp(file.name)
    h1=power((hashcvaleg(im1)-hashcvaleg(im2)),2);
    h=mean(abs(h1));
    nh=[nh h];
    cd 'F:\bxx\files'
end


plot(nh)