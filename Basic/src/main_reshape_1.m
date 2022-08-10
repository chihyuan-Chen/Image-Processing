close;
clc;
clear;
%% main
x = imread('bergen.jpg');
mask_h = [1 0 -1; 2 0 -2; 1 0 -1];
mask_v = [1 2 1; 0 0 0; -1 -2 -1];
x_tmp = imagereshape( x, mask_h, 'addsame', 128);
y_h = imageconvolution( x_tmp, mask_h, false);
y_v = imageconvolution( x_tmp, mask_v, false);
y = imagenormalize( double(y_h) +  double(y_v));
subplot(1, 2, 1); imshow(x);
subplot(1, 2, 2); imshow(y);

