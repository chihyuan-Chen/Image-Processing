function [ result ] = imagenormalize_colorful( inputimage )

gray = 0.299*inputimage(:,:,1)+0.587*inputimage(:,:,2)+0.114*inputimage(:,:,3);
upper = max(max(gray));
lower = min(min(gray));

result = uint8( (double(inputimage - lower)) / double(upper - lower) * 255.0);


end