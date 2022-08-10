function [ result ] = imagenormalize_teacher_colorful( inputimage )
%% �P�O inputimage �O�m��ΦǶ��A�� level �P�O�A�m�⪺ level �O 3 ( �]���OR�BG�BB)�A�Ƕ� level �O 1 ( �]���u�� gray �Ӥw)
[row, column, level] = size(inputimage);

switch level
    case 1
        upper = max(max(inputimage));
        lower = min(min(inputimage));
        result = uint8(double(inputimage - lower) / double(upper - lower) * 255.0);
    case 3  % �w��R�BG�BB�ӧO�����W��
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
        result = uint8(result); % �O�o�q double ��^ uint8 ���A
end

end