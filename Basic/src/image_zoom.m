function [ result ] = imagezoom( inputimage, type)
    [row_img, column_img] = size( inputimage );
    inputimage = double(inputimage);
    switch type
        case 'zero_interleaving' %�s���
            result = zeros(2*row_img, 2*column_img);
            result(1:2:2*row_img, 1:2:2*column_img) = inputimage; % 1:2:2*row_img �����O�q��1��}�l�A�H���j2���覡��J�쥻inputimage��pixel(�ҥH�O�b1�B3�B5�B7�B9...�����)�A�]���n����j2���A�ҥH�|����2*row_img����A�P�z�p1:2:2*column_img
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
            %result = uint8(result); %�s���
            
        case 'nearest_neighbor_interpolation' %��F�����k
            result = uint8(zeros(size(inputimage)*2));
            result(1:2:end, 1:2:end) = inputimage;
            result = imfilter(result, [1 1 0;1 1 0;0 0 0]);
            result = uint8(result);
            
        case 'bilinear_interpolation' %���u�ʤ����k
            result = uint8(zeros(size(inputimage)*2));
            result(1:2:end, 1:2:end) = inputimage;
            mask = [1 2 1;2 4 2;1 2 1]/4;
            %result = imfilter(result,[1 2 1;2 4 2;1 2 1]/4);
            result = uint8(result);
            
        case 'bicubic interpolation'  %���ߤ褺���k
            result = uint8(zeros(size(inputimage)*2));
            result(1:2:end, 1:2:end) = inputimage;
            bfilt = [1 4 6 4 1;4 16 24 16 4;6 24 36 24 6;4 16 24 16 4;1 4 6 4 1]/64;
            result = imfilter(result,bfilt);
            result = uint8(result);
            
        otherwise
            result = uint8(inputimage);
    end
end