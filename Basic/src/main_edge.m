%% initial
clc;
close all;
clear;
%% load image 
x = imread('DI11QUEST.png');
%% show original
figure(1);
imshow(x);
title('原圖')
%% Laplace
lap = fspecial('laplacian', 0);
s_lap = imfilter(x, lap);
%% Prewitt
px = [-1 0 1;-1 0 1;-1 0 1];
py = px';
sx = imfilter(s_lap,px);
sy = imfilter(s_lap,py);
%figure(2);
%imshow(sx);
%figure(3);
%imshow(sy);
edge_p = uint8(sqrt(double(sx).^2 + double(sy).^2));
figure(2);
imshow(edge_p);
%% 二值化
level = graythresh(edge_p);
edge_p = im2bw(edge_p,level);
%% 上色
[B,L] = bwboundaries(edge_p,'noholes');
figure(3);
imshow(x);
title('輸出')
hold on
for k = 1:length(B) 
   boundary = B{k};
   plot(boundary(:,2), boundary(:,1), 'r', 'LineWidth', 1.5)
end
%% 腐蝕後計數
se = strel('rectangle',[2 2]);
edge_p1 = imdilate(edge_p, se);
edge_p1 = im2bw(edge_p1);
edge_p2 = 1 - edge_p1;
figure(4);
imshow(edge_p2);
[label,num]=bwlabel(edge_p2, 8);
fprintf('計數到的方塊數：%d\n',num);
%% Laplace
lap = fspecial('laplacian', 0);
s_lap = imfilter(x, lap);
level = graythresh(s_lap);
s_lap = im2bw(s_lap,level);
figure(5);
imshow(1 - s_lap);


%[L, num] = bwlabel(edge_p, 8);
%stats = regionprops(L, 'Area','PixelList', 'Centroid','BoundindBox');
%stats = regionprops(L, 'Centroid','BoundindBox');
%Cen = cat(1, stats.Centroid);
%for i=1:size(stats)
%    imshow(x)
%    rectangle('position', [stats(i).BoundingBox], 'LineWidth',1, 'LineStyle', '-', 'EdgeColor', 'r');
%    saveas(gcf, sprintf('H:/%d', i),'png')   
%end
        
        