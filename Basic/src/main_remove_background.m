%% load image 
x = imread('keys.png');
figure(1);
y = remove_background(x , 6);
imshow(y);
impixelinfo;