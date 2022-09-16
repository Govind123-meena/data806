i=imread('lena_color.jpg');
figure,imshow(i);
Iblur = imgaussfilt(i, 1);
imwrite(Iblur,'F:\standard-1.jpg');