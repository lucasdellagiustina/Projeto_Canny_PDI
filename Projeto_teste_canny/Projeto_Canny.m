pkg load image;

I = imread('Lili.jpg');
I = rgb2gray(I);
I = double(I) / 255;

[l c] = size(I);

Gx = zeros(l,c);
Gy = zeros(l,c);

for x = 2:l-1
    for y = 2:c-1

        Gx(x,y) = ...
            -I(x-1,y-1) - 2*I(x,y-1) - I(x+1,y-1) + ...
             I(x-1,y+1) + 2*I(x,y+1) + I(x+1,y+1);

        Gy(x,y) = ...
            -I(x-1,y-1) - 2*I(x-1,y) - I(x-1,y+1) + ...
             I(x+1,y-1) + 2*I(x+1,y) + I(x+1,y+1);

    endfor
endfor

G = sqrt(Gx.^2 + Gy.^2);

G = G / max(G(:));

figure;
imshow(I);
title('Imagem Original');

figure;
imshow(G);
title('Canny - Gradiente');
