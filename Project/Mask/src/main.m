%% Initial
close;
clc;
clear;
%% Show Original Image
x = imread('1106104223.bmp');
figure(1);
imshow(x);
%% 針對"上方"錫球做處理，凸顯較"暗"的部分
r = x(:,:,1);
g = x(:,:,2);
b = x(:,:,3);
[row_img,column_img,depth_img] = size(x);
y = zeros(row_img,column_img);
for w = 1:1:column_img
    for h = 1:1:row_img
        if(r(h,w) < 30 && g(h,w) < 30 && b(h,w) < 30)
            y(h,w) = 255;
        end
    end
end
y = uint8(y);
%% 二值化
level = graythresh(y);
y = im2bw(y,level);
%% 膨脹
se1 = strel('disk', 5);
y1 = imdilate(y, se1);
%% 取得"上方"錫球的"圓心座標"
[centersBright1, radiiBright1] = imfindcircles(y1, [30 100]);
a = centersBright1(1,1);% 上方錫球圓心 X 座標
a1 = centersBright1(1,2);% 上方錫球圓心 Y 座標
%% 針對"側方"和"下方"錫球做處理，首先直接"二值化"，因為有"反光"的關係，"亮"的部分很明顯，可做為擷取的"特徵"
level = graythresh(x);
z = im2bw(x,level);
%% 先"膨脹"，再"侵蝕"，最後再"膨脹"
se2 = strel('disk', 3);
se3 = strel('disk', 1);
se4 = strel('disk', 7);
z1 = imdilate(z, se2);
z2 = imerode(z1, se4);
z3 = imdilate(z2, se3);
%% 取得"側方"和"下方"錫球的"圓心座標"
[centersBright, radiiBright] = imfindcircles (z3, [15 40], 'ObjectPolarity' , 'bright' );
v = centersBright(1,1);% 側方錫球圓心 X 座標
v1 = centersBright(1,2);% 側方錫球圓心 Y 座標
h = centersBright(3,1);% 下方錫球圓心 X 座標
h1 = centersBright(3,2);% 下方錫球圓心 Y 座標
%% 上色，將"指定"的錫球部分挖除
figure(2);
imshow(x);
hold on
%以"上方"錫球圓心為基準，畫"黑色實心圓"，將"上方"錫球挖除
rectangle('position',[a-28,a1-28,28*2,28*2],'curvature',[1,1],'edgecolor','k','facecolor','k');
%以"側方"錫球圓心為基準，畫"黑色實心圓"，將"側方"錫球挖除
rectangle('position',[v-28,v1-28,28*2,28*2],'curvature',[1,1],'edgecolor','k','facecolor','k');
%以"下方"錫球圓心為基準，畫"黑色實心圓"，將"下方"錫球挖除
rectangle('position',[h-28,h1-28,28*2,28*2],'curvature',[1,1],'edgecolor','k','facecolor','k');
hold off