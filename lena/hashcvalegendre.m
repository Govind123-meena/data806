i=imread('s0.5.jpg');
img1=imresize(i,[256 256]);
figure,imshow(img1);
i1=im2double(img1);
[r,c]=size(i1);
y=i1(:,:,1);
cb=i1(:,:,2);
cr=i1(:,:,3);
ymean=mean(mean(y));
cbmean=mean(mean(cb));
crmean=mean(mean(cr));
for p=1:256
    for q=1:256
        u = [y(p,q) cb(p,q) cr(p,q)];
v = [ymean cbmean crmean];
C(p,q) = dot(u,v)/(norm(u)*norm(v));
dd(p,q)=sqrt(1-C(p,q)^2);
    end
end
figure,imshow(dd);
order=12;
n1=order+1;
n2=n1+1;
feature=(n1*n2)/2;
q=zeros(n1,128);
for j=0:order
x=-.9922:(2/128):1;
[pvalue] = plegendre(j,x);
k=j+1;
q(k,1:128)=pvalue;
end

     im=dd;
i1=im2double(im);
i1=imresize(i1,[128 128]);
    for l=1:n1
         for m=1:128 
         p=i1(m,1:128);
         z(l,m)=sum(p.*q(l,1:128));
         end
    end
     v=1;
    for a=1:n1
        for b=1:(n2-a)
            Z(a,b)=sum(q(a,1:128).*z(b,1:128));
        v=v+1;
        end
    end

      Z1=reshape(Z,1,169);
      ind=find(Z1~=0)
  Z2=Z1(ind);
  zxx(1:91)=Z2;zxx=round(zxx);

