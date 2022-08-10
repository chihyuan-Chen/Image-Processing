x = imread('bergen.jpg')
cr = imrotate(x, 60)
figure(1)
imshow(cr)

%% imrotate(A, angle, method, bbox)
%�\��G?�x?�]?���^A��?���N����
%??�GA�X�X�ݾާ@�x?�Aangle�X�X�ݭn��?�����סAmethod�X�X���Ȥ�k�Abbox�X�X?�X?���j�p
%?�ѡG?�x?A��?angle�ס]���N�^�A�䤤angle?�Ψ��ר��ܡF
%method�]�A'nearest'�B'bilinear'�B'bicubic'��??��?�񴡭Ȫk���B��??�ʴ��Ȫk���B���T����?���Ȫk���F
%bbox�]Bounding ? ? box defining size of output image�^�]�A'crop'�B'loose'�A��?���?��?�Z��?���ŵ�??�J?���j�p�Z?�X�M�w��?�Z?���j�p?�X
%�`�Gbbox??�p�G?����crop��?�X?���i�ण����A��?��V?�f??�A��?�p��?������?��?���N���סA�Ϊ̥��}���ơC

crc = imrotate(cr, 60, 'bicubic')
figure(2)
imshow(crc)
crc1 = imrotate(cr, 60, 'bicubic','crop')
figure(3)
imshow(crc1)