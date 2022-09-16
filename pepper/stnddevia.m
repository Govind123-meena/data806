i=imread('Pepp original.jpg');
figure,imshow(i);
Iblur = imgaussfilt(i, 0.3);
imwrite(Iblur,'F:\pepper\standard-0.3.jpg');