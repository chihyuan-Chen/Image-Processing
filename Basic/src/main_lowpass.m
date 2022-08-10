close all;
clear all;

%% ---------Butterworth Lowpass Filters (Fre. Domain)------------
f = imread('circle.png');
f = mat2gray(f,[0 255]);

[M,N] = size(f);
P = 2*M;
Q = 2*N;
fc = zeros(M,N);

for x = 1:1:M
    for y = 1:1:N
        fc(x,y) = f(x,y) * (-1)^(x+y);
    end
end

F = fft2(fc,P,Q);

H_1 = zeros(P,Q);
H_2 = zeros(P,Q);

for x = (-P/2):1:(P/2)-1
     for y = (-Q/2):1:(Q/2)-1
        D = (x^2 + y^2)^(0.5);
        D_0 = 100;
        H_1(x+(P/2)+1,y+(Q/2)+1) = 1/(1+(D/D_0)^2);   
        H_2(x+(P/2)+1,y+(Q/2)+1) = 1/(1+(D/D_0)^6);
     end
end


G_1 = H_1 .* F;
G_2 = H_2 .* F;

g_1 = real(ifft2(G_1));
g_1 = g_1(1:1:M,1:1:N);

g_2 = real(ifft2(G_2));
g_2 = g_2(1:1:M,1:1:N);         

for x = 1:1:M
    for y = 1:1:N
        g_1(x,y) = g_1(x,y) * (-1)^(x+y);
        g_2(x,y) = g_2(x,y) * (-1)^(x+y);
    end
end

%% -----show-------
figure(1);
imshow(f);
title('Original Image');

figure(2);
imshow(log(1 + abs(F)));
title('Fourier');

figure(3);
imshow(H_1);
title('Butterworth Lowpass');

figure(4);
imshow(H_2);
title('Butterworth Lowpass1');

figure(5);
imshow(g_2);
title('Result image');