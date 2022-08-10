close;
clc;
clear;
%% main
x = imread('bergen.jpg');
m = imagezoom(x, 'bilinear_interpolation');
figure(1);
imshow(x);
figure(2);
imshow(m);
