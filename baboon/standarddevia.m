i=imread('babbon original.jpg');
figure,imshow(i);
Iblur = imgaussfilt(i, 1);
imwrite(Iblur,'F:\baboon\standard-1.jpg');