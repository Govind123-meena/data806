i=imread('Plane original.jpg');
figure,imshow(i);
Iblur = imgaussfilt(i, 0.3);
imwrite(Iblur,'F:\plane\standard-0.3.jpg');