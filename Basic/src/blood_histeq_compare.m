close;
clc;
clear;
x = imread('blood.png');

row = 0:1:255;
y = 255 * gaussmf(row, [100 128]);

%for i = 1:256
 %y(1, i) = i - 1;
%end

subplot(2,2,1);
imshow(x);
subplot(2,2,2);
[counts, level] = imhist(x);
plot(level, counts);

[counts, level] = imhist(y);
z = histeq(x, y);

subplot(2,2,3);
imshow(y);
subplot(2,2,4);
[counts, level] = imhist(y);
plot(level, counts);
impixelinfo;