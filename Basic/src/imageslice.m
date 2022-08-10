function [ result ] = imageslice( inputimage, n ) %% n 的值是要量化的階層數，其中result是output，inputimage是input
%% 階層上限
if (n > 255 || n < 0)
    n = 255; %% 將 n 鎖定在 0 ~ 255 
end
%% 正規化
upper = max(max(inputimage));
lower = min(min(inputimage));
result = (double(inputimage) - double(lower)) / double(upper - lower) * 255.0; %%先不做uint8因為下方還需做double運算
%% 建立色階表
map = zeros(1, n+1); %%色階層數儲存 EX:以n = 4階為例，原本是要存0、1、2、3、4，但是我們習慣存1、2、3、4、5，所以界定在1 ~ n+1，而map為1維陣列: map = [1, 2, 3, 4, 5]
map(1, 1) = 0; %%將map[1, 1]也就是"1"先定義成 0 (黑色)
for i=2:n+1    %%接下來將map[1, 2]、map[1, 3]、map[1, 4]、map[1, 5]分別定義為64 、127、191、255
    map(1, i) = 255.0 / n * (i-1);
end
%% 重新填色
[row, column] = size(result); %%算出 result 的長寬尺寸，分別存在 rorw 和 column
for x=1:row                   %%row 跟 column 迴圈是針對每個 (row, column) 也就是每個 pixel 做上色
    for y = 1:column
        for i = 1:n           %%如果result(x, y)介於map(1, 1) ~ map(1, 2) = 0 ~ 64 就是填入"0"(黑色)
            if (result(x, y) >= map(1, i) && result(x, y) < map(1, i+1)) %%如果result(x, y)介於map(1, 2) ~ map(1, 3) = 64 ~ 127 就是填入"64"
                result(x, y) = map(1, i); %%如果result(x, y)介於map(1, 3) ~ map(1, 4) = 127 ~ 191 就是填入"127"
                break;                    %%如果result(x, y)介於map(1, 4) ~ map(1, 5) = 191 ~ 255 就是填入"191"
            end
        end
    end
end
%% 轉回8bit
result = uint8(result); %%將double轉成uint8
end