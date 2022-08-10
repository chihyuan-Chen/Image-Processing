function [ result ] = imagezoom( inputimage, type)
    [row_img, column_img] = size( inputimage );
    inputimage = double(inputimage);
    switch type
        case 'zero_interleaving' %零交錯
            result = zeros(2*row_img, 2*column_img);
            result(1:2:2*row_img, 1:2:2*column_img) = inputimage; % 1:2:2*row_img 指的是從第1格開始，以間隔2的方式填入原本inputimage的pixel(所以是在1、3、5、7、9...中填值)，因為要做放大2倍，所以會做到2*row_img為止，同理如1:2:2*column_img
            result = uint8(result);
            
            %stride = 2;
            %for h = 1 : row_img 
            %   for v = 0 : column_img
            %        result(h, v + stride -1) = inputimage(h, v);
            %    end
            %end  
            %result = uint8(result);
            
            %result = uint8(zeros(size(inputimage)*2));
            %result(1:2:end, 1:2:end) = inputimage;
            %result = uint8(result); %零交錯
            
        case 'nearest_neighbor_interpolation' %近鄰內插法
            result = uint8(zeros(size(inputimage)*2));
            result(1:2:end, 1:2:end) = inputimage;
            result = imfilter(result, [1 1 0;1 1 0;0 0 0]);
            result = uint8(result);
            
        case 'bilinear_interpolation' %雙線性內插法
            result = uint8(zeros(size(inputimage)*2));
            result(1:2:end, 1:2:end) = inputimage;
            mask = [1 2 1;2 4 2;1 2 1]/4;
            %result = imfilter(result,[1 2 1;2 4 2;1 2 1]/4);
            result = uint8(result);
            
        case 'bicubic interpolation'  %雙立方內插法
            result = uint8(zeros(size(inputimage)*2));
            result(1:2:end, 1:2:end) = inputimage;
            bfilt = [1 4 6 4 1;4 16 24 16 4;6 24 36 24 6;4 16 24 16 4;1 4 6 4 1]/64;
            result = imfilter(result,bfilt);
            result = uint8(result);
            
        otherwise
            result = uint8(inputimage);
    end
end