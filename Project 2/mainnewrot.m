clc
clear all;
cd 'F:\'
im1=imread('L50.jpg');
im1=im2double(im1);
im1=imresize(im1,[256 256],'bilinear');
i2=im1;
[r,c]=size(i2);
y=i2(:,:,1);
cb=i2(:,:,2);
cr=i2(:,:,3);
im1new=im1;
for i=1:256
    for j=1:256
        for k=1:3
        if im1(i,j, :)==0
            im1new(i,j, :)=0.3;
        else
            im1new(i,j, :)=im1new(i,j, :);
        end
    end
    end
end
cd 'F:\All'
nh=[];
files=dir('*.jpg');
x= 2:220
for file=files'
    im2=imread(file.name);
    im2=im2double(im2);
im2=imresize(im2,[256 256],'bilinear');
i1=im2;
[r,c]=size(i1);
y=i1(:,:,1);
cb=i1(:,:,2);
cr=i1(:,:,3);
im2new=im2;
for i=1:256
    for j=1:256
        for k=1:3
        if im2(i,j, :)==0
            im2new(i,j, :)=0.3;
        else
            im2new(i,j, :)=im2new(i,j, :);
        end
    end
    end
end
    disp(file.name)
    h1=power((hashcvaleg(im1new)-hashcvaleg(im2new)),2);
    h=mean(abs(h1));
    nh=[nh h];
    cd 'F:\All'
end


