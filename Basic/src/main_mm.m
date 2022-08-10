close;
clc;
clear;
%% main
x = imread('mm.png');
figure(1);
subplot(2,2,1);
imshow(x);
%% 進行二值化後反二值化顯示
level = graythresh(x);
y = im2bw(x,level);
y = 1 - y; 

%y = imageslice_test(x);

subplot(2,2,2);
imshow(y);
%% 消去噪點
se = strel('disk',1);
n = imopen(y, se);
subplot(2,2,3);
imshow(n);
impixelinfo;
%hold on
%% 求重心
[L,num] = bwlabel(n,8);
stats = regionprops(L, 'BoundingBox' ,'Area','Centroid' ,'PixelList' ); 
centroids = cat(1, stats.Centroid);