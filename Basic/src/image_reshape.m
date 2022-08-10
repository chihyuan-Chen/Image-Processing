function [ result ] = imagereshape( inputimage, mask, reshapetype, addpixel)
    [row_img, column_img] = size( inputimage );
    [row_msk, column_msk] = size( mask );
    inputimage = double(inputimage);
    switch reshapetype
        case 'discare'
            result = uint8(inputimage);
        case 'addzero'
            stride_height = (row_msk - 1) / 2;
            stride_width = (column_msk - 1) / 2;
            result = zeros(row_img + stride_height * 2, column_img + stride_width * 2);
            result(stride_height + 1:row_img + stride_height, stride_width + 1:column_img + stride_width) = inputimage;
            result = uint8(result);
        case 'addsame'
            stride_height = (row_msk - 1) / 2;
            stride_width = (column_msk - 1) / 2;
            result = zeros(row_img + stride_height * 2, column_img + stride_width * 2);
            result = result + addpixel;
            result(stride_height + 1:row_img + stride_height, stride_width + 1:column_img + stride_width) = inputimage;
            result = uint8(result);
        case 'symmetric'
            stride_height = (row_msk - 1) / 2;
            stride_width = (column_msk - 1) / 2;
            result = zeros(row_img + stride_height * 2, column_img + stride_width * 2);
            result(stride_height + 1:row_img + stride_height, stride_width + 1:column_img + stride_width) = inputimage;
            
            result(1:stride_height, stride_width + 1:column_img + stride_width) = inputimage(row_img - stride_height + 1:row_img, :);%up
            result(row_img + stride_height * 2 - stride_height + 1:row_img + stride_height * 2, stride_width + 1:column_img + stride_width) = inputimage(1:stride_height, :);%down
            result(stride_height + 1:row_img + stride_height, 1:stride_width) = inputimage(:, column_img - stride_width + 1:column_img);%left
            result(stride_height + 1:row_img + stride_height, column_img + stride_width * 2 - stride_width + 1:column_img + stride_width * 2) = inputimage(:, 1:stride_width);%right
            
            result(1:stride_height, 1:stride_width) = inputimage(row_img - stride_height + 1:row_img, column_img - stride_width + 1:column_img);%up - left
            result(1:stride_height, column_img + stride_width * 2 - stride_width + 1:column_img + stride_width * 2) = inputimage(row_img - stride_height + 1:row_img, 1:stride_width);%up - rught
            result(row_img + stride_height * 2 - stride_height + 1:row_img + stride_height * 2, 1:stride_width) = inputimage(1:stride_height, column_img - stride_width + 1:column_img);%down
            result(row_img + stride_height * 2 - stride_height + 1:row_img + stride_height * 2, column_img + stride_width * 2 - stride_width + 1:column_img + stride_width * 2) = inputimage(1:stride_height, 1:stride_width);%down
            
            result = uint8(result);
        case 'mirror'
            stride_height = (row_msk - 1) / 2;
            stride_width = (column_msk - 1) / 2;
            result = zeros(row_img + stride_height * 2, column_img + stride_width * 2);
            result(stride_height + 1:row_img + stride_height, stride_width + 1:column_img + stride_width) = inputimage;
            
            result(1:stride_height, stride_width + 1:column_img + stride_width) = flipud(inputimage(1:stride_height, :));%up %上下翻轉
            result(row_img + stride_height * 2 - stride_height + 1:row_img + stride_height * 2, stride_width + 1:column_img + stride_width) = flipud(inputimage(row_img - stride_height + 1:row_img, :));%down %上下翻轉
            result(stride_height + 1:row_img + stride_height, 1:stride_width) = fliplr(inputimage(:, 1:stride_width));%left %左右翻轉
            result(stride_height + 1:row_img + stride_height, column_img + stride_width * 2 - stride_width + 1:column_img + stride_width * 2) = fliplr(inputimage(:, column_img - stride_width + 1:column_img));%right %左右翻轉
            
            up_left = fliplr(inputimage(row_img - stride_height + 1:row_img, column_img - stride_width + 1:column_img));
            up_right = fliplr(inputimage(row_img - stride_height + 1:row_img, 1:stride_width));
            down_left = fliplr(inputimage(1:stride_height, column_img - stride_width + 1:column_img));
            down_right = fliplr(inputimage(1:stride_height, 1:stride_width));
            result(1:stride_height, 1:stride_width) = flip(down_right,1);%up - left
            result(1:stride_height, column_img + stride_width * 2 - stride_width + 1:column_img + stride_width * 2) = flip(down_left,1);%up - rught
            result(row_img + stride_height * 2 - stride_height + 1:row_img + stride_height * 2, 1:stride_width) = flip(up_right,1);%down - left
            result(row_img + stride_height * 2 - stride_height + 1:row_img + stride_height * 2, column_img + stride_width * 2 - stride_width + 1:column_img + stride_width * 2) = flip(up_left,1);%down - right
            
            result = uint8(result);
        otherwise
            result = uint8(inputimage);
    end
end