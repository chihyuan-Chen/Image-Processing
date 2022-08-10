close;
clc;
clear;
%% main
x = imread('mm.png');
figure(1);
subplot(2,2,1);
imshow(x);
%% �i��G�Ȥƫ�ϤG�Ȥ����
level = graythresh(x);
y = im2bw(x,level);
y = 1 - y; 

%y = imageslice_test(x);

subplot(2,2,2);
imshow(y);
%% ���h���I
se = strel('disk',1);
n = imopen(y, se);
subplot(2,2,3);
imshow(n);
impixelinfo;
%hold on
%% �D����
[L,num] = bwlabel(n,8);
stats = regionprops(L, 'BoundingBox' ,'Area','Centroid' ,'PixelList' ); 
centroids = cat(1, stats.Centroid);