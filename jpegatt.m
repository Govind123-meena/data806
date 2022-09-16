i=imread('brain.jpg');
i1=im2double(i);
figure,imshow(i1);
i1=imresize(i1,[512 512]);
i1=imresize(i1,0.5);
i1=imresize(i1,2);
imwrite(i1,'scalebrain.jpg');
i=imread('brain.jpg');
figure,imshow(i);
i1=im2double(i);
figure,imshow(i1);
i1=imresize(i1,[512 512]);
% rgb = imread('peppers.png');
% sigma = 10;
% rgb_smoothed = imgaussfilt(rgb,sigma);
% imshow(rgb)
i=imread('brain.jpg');
i1=im2double(i);
figure,imshow(i1);
i1=imresize(i1,[512 512]);

imwrite(i1,'brainjpggatt30.jpg','Quality',30);
imwrite(i1,'brainjpggatt60.jpg','Quality',60);

i=imread('brain.jpg');
i1=im2double(i);
figure,imshow(i1);
i1=imresize(i1,[512 512]);
X=i1;
X2 = imcrop(X,[1 1 256 256]);
imwrite(X2,'brainCROPQ.jpg');
%%%salt and pepper
i=imread('brain.jpg');
i1=im2double(i);
figure,imshow(i1);
i1=imresize(i1,[512 512]);
r1=i1(:,:,1);
g1=i1(:,:,2);
b1=i1(:,:,3);
r1s = imnoise(r1,'salt & pepper',0.05);
g1s = imnoise(g1,'salt & pepper',0.05);
b1s = imnoise(b1,'salt & pepper',0.05);
noisy_salt(:,:,1)=r1s;
noisy_salt(:,:,2)=g1s;
noisy_salt(:,:,3)=b1s;
imwrite(noisy_salt,'brainsalt.jpg');
i=imread('brain.jpg');
i1=im2double(i);
figure,imshow(i1);
i1=imresize(i1,[512 512]);
r1=i1(:,:,1);
g1=i1(:,:,2);
b1=i1(:,:,3);
r1s = imnoise(r1,'speckle',0.04);
g1s = imnoise(g1,'speckle',0.04);
b1s = imnoise(b1,'speckle',0.04);
noisy_salt(:,:,1)=r1s;
noisy_salt(:,:,2)=g1s;
noisy_salt(:,:,3)=b1s;
imwrite(noisy_salt,'brainspeckle.jpg');
i=imread('brain.jpg');
i1=im2double(i);
figure,imshow(i1);
i1=imresize(i1,[512 512]);
r1=i1(:,:,1);
g1=i1(:,:,2);
b1=i1(:,:,3);
r1s = imrotate(r1,50);
g1s = imrotate(g1,50);
b1s = imrotate(b1,50);
r1s=imresize(r1s,[512 512]);
g1s=imresize(g1s,[512 512]);
b1s=imresize(b1s,[512 512]);

noisy_salt(:,:,1)=r1s;
noisy_salt(:,:,2)=g1s;
noisy_salt(:,:,3)=b1s;
imwrite(noisy_salt,'brainrot50.jpg');

i=imread('brain.jpg');
i1=im2double(i);
figure,imshow(i1);
i1=imresize(i1,[512 512]);
r1=i1(:,:,1);
g1=i1(:,:,2);
b1=i1(:,:,3);
r1s = imrotate(r1,70);
g1s = imrotate(g1,70);
b1s = imrotate(b1,70);
r1s=imresize(r1s,[512 512]);
g1s=imresize(g1s,[512 512]);
b1s=imresize(b1s,[512 512]);

noisy_salt(:,:,1)=r1s;
noisy_salt(:,:,2)=g1s;
noisy_salt(:,:,3)=b1s;
imwrite(noisy_salt,'brainrot70.jpg');

%%%%%%%%%%%%%Histogram equilization
i=imread('brain.jpg');
i1=im2double(i);
figure,imshow(i1);
i1=imresize(i1,[512 512]);
r1=i1(:,:,1);
g1=i1(:,:,2);
b1=i1(:,:,3);
r1s = histeq(r1);
g1s = histeq(g1);
b1s = histeq(b1);
r1s=imresize(r1s,[512 512]);
g1s=imresize(g1s,[512 512]);
b1s=imresize(b1s,[512 512]);

noisy_salt(:,:,1)=r1s;
noisy_salt(:,:,2)=g1s;
noisy_salt(:,:,3)=b1s;
imwrite(noisy_salt,'brainhist.jpg');

%%%%%%unsharp filtering
i1=im2double(i);
figure,imshow(i1);
i1=imresize(i1,[512 512]);
r1=i1(:,:,1);
g1=i1(:,:,2);
b1=i1(:,:,3);
h = fspecial('average');
% sharp = imfilter(im,h,'replicate');

r1s =imfilter(r1,h,'replicate');
g1s = imfilter(g1,h,'replicate');
b1s = imfilter(b1,h,'replicate');
r1s=imresize(r1s,[512 512]);
g1s=imresize(g1s,[512 512]);
b1s=imresize(b1s,[512 512]);

noisy_salt(:,:,1)=r1s;
noisy_salt(:,:,2)=g1s;
noisy_salt(:,:,3)=b1s;
imwrite(noisy_salt,'brainavg.jpg');
%%%%%%Low pass filtering
i1=im2double(i);
figure,imshow(i1);
i1=imresize(i1,[512 512]);
r1=i1(:,:,1);
g1=i1(:,:,2);
b1=i1(:,:,3);
h = fspecial('unsharp');
% sharp = imfilter(im,h,'replicate');

r1s =imfilter(r1,h,'replicate');
g1s = imfilter(g1,h,'replicate');
b1s = imfilter(b1,h,'replicate');
r1s=imresize(r1s,[512 512]);
g1s=imresize(g1s,[512 512]);
b1s=imresize(b1s,[512 512]);

noisy_salt(:,:,1)=r1s;
noisy_salt(:,:,2)=g1s;
noisy_salt(:,:,3)=b1s;
imwrite(noisy_salt,'brainunsharp.jpg');




