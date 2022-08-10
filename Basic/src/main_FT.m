%% 原圖
a = imread('circle.png');
%a = [zeros(256,128) ones(256, 128)];
a = im2double(a); 
figure(1);
%subplot(2,2,1);
imshow(a);
title('original');
impixelinfo;
%% 傅立葉轉換
a1 = fft2(a);
figure(2)
%subplot(2,2,2);
imshow(a1);

a2 = fftshift(fft2(a));
figure(3)
%subplot(2,2,3);
imshow(a2);

a3 = log(1 + abs(a2));
figure(4)
%subplot(2,2,4);
imshow(mat2gray(a3));
title('Fourier');
impixelinfo;
%% 反傅立葉轉換
a5 = real(ifft2(ifftshift(a2))); 
a6 = im2uint8(mat2gray(a5)); 
figure(5);
imshow(a6);
title('anti-Fourier');
impixelinfo;