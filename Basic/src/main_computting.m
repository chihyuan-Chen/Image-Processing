x = imread('keys.png');
%% �B�� " �[��� " �ӭק�v���A�o��Q�n���ĪG
y = uint8(( double(x) -75 ) / 100);
z = imagenormalize( y );

subplot(2,1,1);
imshow(x);
subplot(2,1,2);
imshow(z);
impixelinfo;