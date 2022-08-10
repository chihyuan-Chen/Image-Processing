x = imread('keys.png');
%% 運用 " 加減乘除 " 來修改影像，得到想要的效果
y = uint8(( double(x) -75 ) / 100);
z = imagenormalize( y );

subplot(2,1,1);
imshow(x);
subplot(2,1,2);
imshow(z);
impixelinfo;