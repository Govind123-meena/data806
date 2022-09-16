function hash = hash_value(i)
    %%%%%%%%%%%%Read Color image 
    i=imread('original.jpg');
i=imresize(i,[512 512]);
%%%%%%convert rgbtohsi image
 i1=rgb2hsv(i);
h=i1(:,:,1);
s=i1(:,:,2);
v=i1(:,:,3);
% figure,imshow(h);
% figure,imshow(s);
% figure,imshow(v);
i2=rgb2ycbcr(i);
y=i2(:,:,1);
cb=i2(:,:,2);
cr=i2(:,:,3);
% figure,imshow(y);
% figure,imshow(cb);
% figure,imshow(cr);
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
%%%%%%%%%%find mean and variance of each row
p=zeros(12,64);
for i=1:12
       a=v(i,1:64);
       row_mean=mean(a);
       row_sd=std(a);
       for j=1:64
            p(i,j)=(a(j)-row_mean)/row_sd;
       end
end 

%%%%%%%%%%i=6 From row of 64 elements pick 12 values randomly
co=zeros(12,1);
for i=1:12
    r=randi([1,12]);
    co(i,1)=p(i,r);
end

%%%%%%%%%%%Find eucledian distance between each column with values in z1
hash=zeros(1,64);

for i=1:64
    c=p(:,i);
    hash(i)=norm(co-c);
end
end


