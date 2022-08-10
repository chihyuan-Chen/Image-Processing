%% load image 
x = imread('gull.png');
%% show original
figure(1);
imshow(x);
impixelinfo;
%% normalize
figure(2);
y = imagenormalize_teacher_colorful(x);
r = y(:, :, 1);
g = y(:, :, 2);
b = y(:, :, 3);
rgbimage(:,:,1) = r;
rgbimage(:,:,2) = g;
rgbimage(:,:,3) = b;
imshow(rgbimage);
impixelinfo;
%% normalize2
figure(3);
z = imagenormalize2(x , 255, 80);
imshow(z);
%% imageslice
figure(4);
w = imageslice_colorful(x , 8);%%¶q¤Æ¬°4¶¥
imshow(w);