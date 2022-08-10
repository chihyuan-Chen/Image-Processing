g = rgb2gray(imread('gull.png'));
%% 胡椒鹽雜訊
gsp = imnoise(g, 'salt & pepper');
gsp1 = imnoise(g, 'salt & pepper', 0.2); %影像的20%受到胡椒鹽雜訊干擾
figure(1);
subplot(1,2,1);
imshow(gsp);
title('胡椒鹽雜訊');
subplot(1,2,2);
imshow(gsp1);
title('20% 胡椒鹽雜訊');
%% 高斯雜訊
gg = imnoise(g, 'gaussian');
figure(2);
imshow(gg);
title('高斯雜訊');
%% 斑點雜訊
gs = imnoise(g, 'speckle');
figure(3);
imshow(gs);
title('斑點雜訊');
%% Lena 2處理
L = rgb2gray(imread('lena2.jpg'));
figure(4);
subplot(2,2,1);
imshow(L);
title('原圖');

a3 = fspecial('average');
g3 = imfilter(L, a3);
subplot(2,2,2);
imshow(g3);
title('低通濾波 3*3');

gm3 = medfilt2(L);
gm3 = medfilt2(gm3);
gm3 = medfilt2(gm3);
subplot(2,2,3);
imshow(gm3);
title('中間值濾波 3次');
%% Lena 1處理
L1 = rgb2gray(imread('lena1.jpg'));
figure(5);
subplot(2,2,1);
imshow(L1);
title('原圖');

a3 = fspecial('average');
g3 = imfilter(L1, a3);
subplot(2,2,2);
imshow(g3);
title('低通濾波 3*3');

gm1 = medfilt2(L1);

subplot(2,2,3);
imshow(gm1);
title('中間值濾波 3次');

