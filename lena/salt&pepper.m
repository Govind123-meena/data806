i=imread('lena_color.jpg');
d=0.5
figure,imshow(i);
i1=rgb2ycbcr(i);
y=i1(:,:,1);
cb=i1(:,:,2);
cr=i1(:,:,3);
i1 = imnoise(I,'salt & pepper',d)
y1=i1;
y1=imresize(y1,[256 256]);
i3(:,:,1)=y1;
i3(:,:,2)=cb;
i3(:,:,3)=cr;
x1=ycbcr2rgb(i3);
figure,imshow(x1);
%imwrite(x1,'s5.jpg');
imwrite(x1,'F:\s0.9.jpg');
