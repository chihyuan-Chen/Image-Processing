function [ result ] = imagenormalize_teacher_colorful( inputimage )
%% 判別 inputimage 是彩色或灰階，用 level 判別，彩色的 level 是 3 ( 因為是R、G、B)，灰階 level 是 1 ( 因為只有 gray 而已)
[row, column, level] = size(inputimage);

switch level
    case 1
        upper = max(max(inputimage));
        lower = min(min(inputimage));
        result = uint8(double(inputimage - lower) / double(upper - lower) * 255.0);
    case 3  % 針對R、G、B個別做正規化
        r = inputimage(:, :, 1); 
        upper = max(max(r));
        lower = min(min(r));
        result_r = double(r - lower) / double(upper - lower) * 255.0;
        g = inputimage(:, :, 2);
        upper = max(max(g));
        lower = min(min(g));
        result_g = double(g - lower) / double(upper - lower) * 255.0;
        b = inputimage(:, :, 3);
        upper = max(max(b));
        lower = min(min(b));
        result_b = double(b - lower) / double(upper - lower) * 255.0;
        result = zeros(row, column, 3);
        result(:, :, 1) = result_r;
        result(:, :, 2) = result_g;
        result(:, :, 3) = result_b;
        result = uint8(result); % 記得從 double 轉回 uint8 型態
end

end