function [ result ] = imagenormalize2( inputimage, a, b )

upper = a;
lower = b;

result = uint8( (double(inputimage) - double(lower)) / double(upper - lower) * 255.0);


end