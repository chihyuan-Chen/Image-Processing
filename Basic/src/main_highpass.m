I=imread('circle.png');  
figure(1)
imshow(I);
title('原圖像');
s=fftshift(fft2(I));  %傅立葉
figure(2)
imshow(mat2gray(log(1 + abs(s))));
title('傅立葉轉換');
[a,b]=size(s);
a0=round(a/2);
b0=round(b/2);
d=10;
p=0.2;q=0.5;
for i=1:a
    for j=1:b
        distance=sqrt((i-a0)^2+(j-b0)^2);
        if distance<=d 
            h=0;
        else
            h=1;
        end
        s(i,j)=(p+q*h)*s(i,j);
    end
end
s=uint8(real(ifft2(ifftshift(s))));
figure(3)
imshow(s);
title('高斯濾波圖像');
figure(4)
imshow(s+I);
title('高頻增強圖像');