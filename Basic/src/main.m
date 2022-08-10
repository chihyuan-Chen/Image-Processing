%% load image 
x = imread('br_cat.png');
%% show original
figure(1);
imshow(x);
impixelinfo;
%% normalize
figure(2);
y = imagenormalize(x);
imshow(y);
%% normalize2
figure(3);
z = imagenormalize2(x , 255, 80);
imshow(z);
%% normalize3
figure(4);
w = imageslice(x , 4);%%¶q¤Æ¬°4¶¥
imshow(w);