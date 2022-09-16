clc;
clear all;
cd 'F:\All'
for k=1:2
im1=imread(strcat(strcat('L',num2str(k),'.jpg')));
cd 'F:\All'
nh=[];
files=dir('*.jpg');
x= 1:2
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
end
    disp(file.name)
    h1=power((hashcvaleg(im1)-hashcvaleg(im2new)),2);
    h=mean(abs(h1));
    nh=[nh h];
    cd 'F:\All'



    
    
    
    
    
    
    
    
    
end
