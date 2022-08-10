close;
clc;
clear;

x = imread('mm.png')
r = x(:,:,1);
g = x(:,:,2);
b = x(:,:,3);

[row_img,column_img,depth_img] = size(x);
y = zeros(row_img,column_img);
for w = 1:1:column_img
    for h = 1:1:row_img
        if(r(h,w) > 128 && g(h,w) < 100 && b(h,w) < 100)
            y(h,w) = 255;
        end
    end
end
y = uint8(y);
figure(1)
subplot(1,2,1);imshow(x)
subplot(1,2,2);imshow(y)

se = strel('disk', 2);
se1 = strel('disk', 7);
g = imerode(y, se);
figure(2)
imshow(g);

g1 = imdilate(g, se1);
figure(3)
imshow(g1);


%[L,num] = bwlabel(g1,8);
%stats = regionprops(L, 'BoundingBox' ,'Area','Centroid' ,'PixelList' ); 
%centroids = cat(1, stats.Centroid);

%for i=1:size(stats)
%    area = stats(i).Area;
%    for area

