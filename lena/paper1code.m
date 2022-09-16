%%%%%%%%%%%%Read Color image 
clc;
clear all
close all
%%%%%%%%%%%no attack
i=imread('original.jpg');
figure,imshow(i);
i=imresize(i,[512 512]);
%%%%%%convert rgbtohsi image
 i1=rgb2hsv(i);
h=i1(:,:,1);
s=i1(:,:,2);
v=i1(:,:,3);
 figure,imshow(h);
 figure,imshow(s);
 figure,imshow(v);
i2=rgb2ycbcr(i);
y=i2(:,:,1);
cb=i2(:,:,2);
cr=i2(:,:,3);
 figure,imshow(y);
 figure,imshow(cb);
 figure,imshow(cr);
%%%%%%%%%%%%%%%%%divide h, s, v into nonoverlapping blocks of size 32*32
for i=1:8
    for j=1:8
        k=(i-1)*32+1;
        l=(j-1)*32+1;
        a=y(k:k+31,l:l+31);
        my(i,j)=mean2(a);
        vary(i,j)=std2(a);
            end 
end
my=my(:);
        vary=vary(:);
for i=1:8
    for j=1:8
        k=(i-1)*32+1;
        l=(j-1)*32+1;
        a=cb(k:k+31,l:l+31);
        mcb(i,j)=mean2(a);
        varcb(i,j)=std2(a);
            end 
end
mcb=mcb(:);
varcb=varcb(:);
for i=1:8
    for j=1:8
        k=(i-1)*32+1;
        l=(j-1)*32+1;
        a=cr(k:k+31,l:l+31);
        mcr(i,j)=mean2(a);
        varcr(i,j)=std2(a);
    end 
end
mcr=mcr(:);
varcr=varcr(:);
for i=1:8
    for j=1:8
        k=(i-1)*32+1;
        l=(j-1)*32+1;
        a=h(k:k+31,l:l+31);
        mh(i,j)=mean2(a);
        varh(i,j)=std2(a);
    end 
end
mh=mh(:);
varh=varh(:);
for i=1:8
    for j=1:8
        k=(i-1)*32+1;
        l=(j-1)*32+1;
        a=s(k:k+31,l:l+31);
        ms(i,j)=mean2(a);
        vars(i,j)=std2(a);
    end 
 end
ms=ms(:);
vars=vars(:);
for i=1:8
    for j=1:8
        k=(i-1)*32+1;
        l=(j-1)*32+1;
        a=v(k:k+31,l:l+31);
        mv(i,j)=mean2(a);
        varv(i,j)=std2(a);
    end 
end
mv=mv(:);
varv=varv(:);
v=[my vary mcb varcr mcb varcb mh varh ms vars mv varv]';
 k=1;
% %%%%%%%%%%find mean and variance of each row
 for i=1:12
        a=v(i,k:k+63);
         mp(i)=mean(a);
         varp(i)=std(a);
 end 
 v=[my vary mcb varcr mcb varcb mh varh ms vars mv varv]';
 k=1;
 for i=1:12
        a=v(i,k:k+63);
         m=mp(i);
         vz=varp(i);
         anew(i,:)=((a-ones(1,1)*64*m)/ones(1,1)*64*vz);
 end
 %%%%%%%%%%i=6 From row of 64 elements pick 12 values randomly
 z=sort(anew(i,:),'ascend');
 z1=z(1:12)';
 %%%%%%%%%%%Find eucledian distance between each column with values in z1
 v=[my vary mcb varcr mcb varcb mh varh ms vars mv varv]';
 j=1;
 aa=zeros(1,12);
 for i=1:64
        aa=v(:,i);
        aa1=aa-z1;
        h1=norm(aa1);
        h22(i)=h1;
 end
       h_noattack=h22;
%       %%%%%%%%%contrastenhatt
       i=imread('gammacorr_1.25.jpg');
 figure,imshow(i);
 i=imresize(i,[512 512]);
% %%%%%%convert rgbtohsi image
  i1=rgb2hsv(i);
 h=i1(:,:,1);
 s=i1(:,:,2);
 v=i1(:,:,3);
  figure,imshow(h);
 figure,imshow(s);
 figure,imshow(v);
 i2=rgb2ycbcr(i);
 y=i2(:,:,1);
 cb=i2(:,:,2);
 cr=i2(:,:,3);
 figure,imshow(y);
 figure,imshow(cb);
 figure,imshow(cr);
 %%%%%%%%%%%%%%%%%divide h, s, v into nonoverlapping blocks of size 32*32
 for i=1:8
     for j=1:8
         k=(i-1)*32+1
         l=(j-1)*32+1
         a=y(k:k+31,l:l+31);
         my(i,j)=mean2(a);
         vary(i,j)=std2(a);
             end 
 end
 my=my(:);
         vary=vary(:);
 for i=1:8
     for j=1:8
         k=(i-1)*32+1
         l=(j-1)*32+1
         a=cb(k:k+31,l:l+31);
         mcb(i,j)=mean2(a);
         varcb(i,j)=std2(a);
             end 
 end
 mcb=mcb(:);
 varcb=varcb(:);
 for i=1:8
     for j=1:8
         k=(i-1)*32+1
         l=(j-1)*32+1
         a=cr(k:k+31,l:l+31);
         mcr(i,j)=mean2(a);
         varcr(i,j)=std2(a);
     end 
 end
 mcr=mcr(:);
 varcr=varcr(:);
 for i=1:8
     for j=1:8
         k=(i-1)*32+1
         l=(j-1)*32+1
         a=h(k:k+31,l:l+31);
         mh(i,j)=mean2(a);
         varh(i,j)=std2(a);
     end 
 end
 mh=mh(:);
 varh=varh(:);
 for i=1:8
     for j=1:8
         k=(i-1)*32+1
         l=(j-1)*32+1
         a=s(k:k+31,l:l+31);
         ms(i,j)=mean2(a);
         vars(i,j)=std2(a);
     end 
  end
 ms=ms(:);
 vars=vars(:);
 for i=1:8
     for j=1:8
         k=(i-1)*32+1
         l=(j-1)*32+1
         a=v(k:k+31,l:l+31);
         mv(i,j)=mean2(a);
         varv(i,j)=std2(a);
     end 
 end
 mv=mv(:);
 varv=varv(:);
 v=[my vary mcb varcr mcb varcb mh varh ms vars mv varv]';
 k=1;
 %%%%%%%%%%find mean and variance of each row
 for i=1:12
        a=v(i,k:k+63);
         mp(i)=mean(a);
         varp(i)=std(a);
 end 
 v=[my vary mcb varcr mcb varcb mh varh ms vars mv varv]';
 k=1;
 for i=1:12
        a=v(i,k:k+63);
         m=mp(i);
         vz=varp(i);
         anew(i,:)=((a-ones(1,1)*64*m)/ones(1,1)*64*vz);
 end
% %%%%%%%%%%i=6 From row of 64 elements pick 12 values randomly
 z=sort(anew(i,:),'ascend');
 z1=z(1:12)';
 %%%%%%%%%%%Find eucledian distance between each column with values in z1
 v=[my vary mcb varcr mcb varcb mh varh ms vars mv varv]';
 j=1;
 aa=zeros(1,12);
 for i=1:64
        aa=v(:,i);
        aa1=aa-z1;
        h1=norm(aa1);
        h23(i)=h1;
 end
 x=h23-h22;
 d=norm(x,2);
 
% 
% 
% 
% 
% 
%     