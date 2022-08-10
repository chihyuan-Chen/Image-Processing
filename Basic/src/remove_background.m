function [ result ] = remove_background( inputimage, command)
switch command
    case 1 
        result = inputimage - 128;
    case 2 
        result = inputimage + 128;
    case 3 
        result = inputimage * 2 ;
    case 4 
        result = inputimage / 2 ;
    case 5 
        result = 255 - inputimage;
    case 6 
        result = (255 - inputimage)+50;
end