function [ result ] = imageslice( inputimage, n ) %% n ���ȬO�n�q�ƪ����h�ơA�䤤result�Ooutput�Ainputimage�Oinput
%% ���h�W��
if (n > 255 || n < 0)
    n = 255; %% �N n ��w�b 0 ~ 255 
end
%% ���W��
upper = max(max(inputimage));
lower = min(min(inputimage));
result = (double(inputimage) - double(lower)) / double(upper - lower) * 255.0; %%������uint8�]���U���ٻݰ�double�B��
%% �إߦⶥ��
map = zeros(1, n+1); %%�ⶥ�h���x�s EX:�Hn = 4�����ҡA�쥻�O�n�s0�B1�B2�B3�B4�A���O�ڭ̲ߺD�s1�B2�B3�B4�B5�A�ҥH�ɩw�b1 ~ n+1�A��map��1���}�C: map = [1, 2, 3, 4, 5]
map(1, 1) = 0; %%�Nmap[1, 1]�]�N�O"1"���w�q�� 0 (�¦�)
for i=2:n+1    %%���U�ӱNmap[1, 2]�Bmap[1, 3]�Bmap[1, 4]�Bmap[1, 5]���O�w�q��64 �B127�B191�B255
    map(1, i) = 255.0 / n * (i-1);
end
%% ���s���
[row, column] = size(result); %%��X result �����e�ؤo�A���O�s�b rorw �M column
for x=1:row                   %%row �� column �j��O�w��C�� (row, column) �]�N�O�C�� pixel ���W��
    for y = 1:column
        for i = 1:n           %%�p�Gresult(x, y)����map(1, 1) ~ map(1, 2) = 0 ~ 64 �N�O��J"0"(�¦�)
            if (result(x, y) >= map(1, i) && result(x, y) < map(1, i+1)) %%�p�Gresult(x, y)����map(1, 2) ~ map(1, 3) = 64 ~ 127 �N�O��J"64"
                result(x, y) = map(1, i); %%�p�Gresult(x, y)����map(1, 3) ~ map(1, 4) = 127 ~ 191 �N�O��J"127"
                break;                    %%�p�Gresult(x, y)����map(1, 4) ~ map(1, 5) = 191 ~ 255 �N�O��J"191"
            end
        end
    end
end
%% ��^8bit
result = uint8(result); %%�Ndouble�নuint8
end