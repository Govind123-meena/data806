i=imread('house original.jpg');
figure,imshow(i);
Iblur = imgaussfilt(i, 0.9);
imwrite(Iblur,'F:\house\standard-0.9.jpg');