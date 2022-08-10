close;
clc;
clear;
%% main
x = imread('bergen.jpg');
mask = zeros(101, 101);
y = imagereshape( x, mask, 'symmetric');
z = imagereshape_1( x, mask, 'mirror');
figure(1);
imshow(x);
figure(2);
imshow(z);
