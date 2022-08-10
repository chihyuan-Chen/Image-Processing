x = imread('bergen.jpg')
cr = imrotate(x, 60)
figure(1)
imshow(cr)

%% imrotate(A, angle, method, bbox)
%功能：?矩?（?片）A旋?任意角度
%??：A——待操作矩?，angle——需要旋?的角度，method——插值方法，bbox——?出?像大小
%?解：?矩?A旋?angle度（任意），其中angle?用角度制表示；
%method包括'nearest'、'bilinear'、'bicubic'分??“?近插值法”、“??性插值法”、“三次卷?插值法”；
%bbox（Bounding ? ? box defining size of output image）包括'crop'、'loose'，分?表示?旋?后的?像剪裁??入?像大小后?出和已旋?后?像大小?出
%注：bbox??如果?取‘crop’?出?像可能不完整，旋?方向?逆??，比?小的?片不建?旋?任意角度，或者先稀疏化。

crc = imrotate(cr, 60, 'bicubic')
figure(2)
imshow(crc)
crc1 = imrotate(cr, 60, 'bicubic','crop')
figure(3)
imshow(crc1)