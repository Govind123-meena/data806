% clear all
% close all
% fng='.jpg';
% sum=0;
% j=1;
% for i=1:100
%    
% i1=imread(strcat(strcat('s', num2str(j)),'.jpg'));
% h1=hashcvaleg(i1);
% i1=imread(s1);
% h2=hashcvaleg(i1);
% hx=h1-h2;
%     h=norm(hx,2);
%     hzz(i)=h;
%     sum(j)=sum+hzz(i);
%     sum(j)=sum/100;
%     end
% 
i=imread('jjj.jpg');
i=im2double(i);
% % i=imcrop(i,[68 78 186 196]);
% % figure, imshow(i);
h1=hashcvaleg(i);
% figure,imshow(i);
% i1=imresize(i,0.5);
% i1=imresize(i1,2);
% h2=hashcvaleg(i1);
% figure, imshow(i1);
% imwrite(i1,'scaleroi.jpg');
% i2=i1-0.01;
% h3=hashcvaleg(i2);
% 
% imwrite(i1,'conroi.jpg');
% 
% % 
