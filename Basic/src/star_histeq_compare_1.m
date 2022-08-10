close;
clc;
clear;
x = imread('1.png');
y = imread('2.png');

subplot(2,2,1);
imshow(x);
subplot(2,2,2);
[counts, level] = imhist(x);
plot(level, counts);

subplot(2,2,3);
imshow(y);
subplot(2,2,4);
[counts, level] = imhist(y);
plot(level, counts);
impixelinfo;