function [ result ] = imagenormalize( inputimage )

upper = max(max(inputimage));
lower = min(min(inputimage));

result = uint8( (double(inputimage - lower)) / double(upper - lower) * 255.0);


end