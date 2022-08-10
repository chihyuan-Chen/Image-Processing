close;
clc;
clear;
%% main
x = imread('sample.png');
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

%z = bwlabel(y,4);
%Ar = regionprops(z,'Area');
%Ce = regionprops(z,'Centroid');
%y = double(y);
%[rows,cols] = size(y); 
%a = ones(rows,1)*[1:cols];
%b = [1:rows]'*ones(1,cols);   
%area = sum(sum(y)); 
%meanx = sum(sum(y.*a))/area; 
%meany = sum(sum(y.*b))/area;
%% 切割圖像
a = centroids(1,1);
b = centroids(1,2);
z = imcrop(n,[a-80,b-80,159,159]); %圖片裡剪切的起點a-40,b-40，剪切的大小80*80。
%z = n((centroids(1,1)-20):(centroids(1,1)+20),(centroids(1,2)-50):(centroids(1,2)+50),:);
%z = y(meanx-20:meanx+20,meany-20:meany+20,:);
subplot(2,2,4);
imshow(z);
imwrite(z,'test01.jpg');
%% 雙線性內插法 放大
m1 = imread('test01.jpg');
%m = bilinear_zoom(m1,8);
%m2 = imagezoom(m1,'bilinear_interpolation');
%m = imagezoom(m2,'bilinear_interpolation');
m = InterpolationBilinear(m1);
figure(2);
imshow(m1);
figure(3);
imshow(m);
%% 邊緣檢測
BW = edge(m,'sobel');
figure(4);
imshow(BW);
impixelinfo;

%imwrite(BW2,'test01.jpg');
%BW = imread('test01.jpg');

%mask_h = [1 0 -1; 2 0 -2; 1 0 -1];
%mask_v = [1 2 1; 0 0 0; -1 -2 -1];
%x_tmp = imagereshape( m, mask_h, 'addsame', 128);
%y_h = imageconvolution( x_tmp, mask_h, false);
%y_v = imageconvolution( x_tmp, mask_v, false);
%BW = imagenormalize(double(y_h) +  double(y_v));
%% 邊緣提取
[B,L] = bwboundaries(BW,'noholes');
%% 找重心
BW1 = bwlabel(BW,8);
Ar = regionprops(BW1,'Area');
Ce = regionprops(BW1,'Centroid');
BW = double(BW);
[rows,cols] = size(BW); 
s1 = ones(rows,1)*[1:cols];
s2 = [1:rows].*ones(1,cols);   
area = sum(sum(BW)); 
meanx = sum(sum(BW.*s1))/area; 
meany = sum(sum(BW.*s2))/area;
%% 上色
figure(5);
imshow(1-BW);
%axis on %x、y軸
hold on;
% Plot cross at center of gravity
plot(meanx, meany, 'r+', 'MarkerSize', 10, 'LineWidth', 2);
imcontour(1-BW,'-g');
%colors=['b' 'g' 'r' 'c' 'm' 'y'];
%plot(meanx, meany, 'r+'); 
hold off


