close;
clc;
clear;
x = imread('car.png');
y = imread('backyard.png');

[r1, c1, d1] = size(x);
[r2, c2, d2] = size(y);

z1 = imagenormalize_teacher_colorful( x );
z2 = imagenormalize_teacher_colorful( y );
figure(1);
imshow(x);
figure(2);
imshow(z1);
figure(3);
imshow(y);
figure(4);
imshow(z2);