function [ result ] = imageconvolution( inputimage, mask, normalize )
    [row_img, column_img] = size( inputimage );
    [row_msk, column_msk] = size( mask );
    
    inputimage = double(inputimage);
    
    result = zeros(row_img - row_msk + 1, column_img - column_msk + 1);
    
    for h = 1:row_img - row_msk + 1
        for w = 1:column_img - column_msk + 1
            result(h, w) = sum(sum(inputimage(h:h + row_msk - 1, w:w + column_msk - 1) .* mask));
        end
    end
    
    if (normalize)
        result = imagenormalize( result );
    end
    
    result = uint8(result);
end