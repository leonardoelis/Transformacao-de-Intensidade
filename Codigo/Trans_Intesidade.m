close all
clear all
clc

%%1) Leitura da imagem
imgTire = imread('tire.tif');
figure
imshow(imgTire);

%%2) Negativando imagem
imgNeg = 255 - imgTire;
figure
imshow(imgNeg)

%%3) Transformação gama
figure, subplot(2,2,1), imshow(imgTire);
title('Imagem Original')

gama_1 = imadjust(imgTire,[],[],1);
subplot(2,2,2), imshow(gama_1);
title('Gama = 1')

gama_2 = imadjust(imgTire,[],[],3);
subplot(2,2,3), imshow(gama_2);
title('Gama = 3')

gama_04 = imadjust(imgTire,[],[],0.4);
subplot(2,2,4), imshow(gama_04);
title('Gama = 0.4')

%%4) Transformações Logarítmicas
figure
subplot(2,2,1)
imshow(imgTire);
title('Imagem Original')

r = im2double(imgTire);

c = 1;
s = (c*log(1+r)*256);
subplot(2,2,2)
imshow(uint8(s));
title('c = 1')

c = 2;
s = (c*log(1+r)*256);
subplot(2,2,3)
imshow(uint8(s));
title('c = 2')

c = 3;
s = (c*log(1+r)*256);
subplot(2,2,4)
imshow(uint8(s));
title('c = 3')

%%5) Transformações logarítmicas com diferentes domínios
r = im2double(imgTire);

figure
subplot(2,2,1)
imshow(r);
title('Imagem Original')

f = r;
c = 1/log(1+1);
s_1 = c*log(1+f);
subplot(2,2,2), imshow(s_1);
title('Domínio [0, 1]')

f = r*255;
c = 1/log(1+255);
s_2 = c*log(1+f);
subplot(2,2,3), imshow(s_2);
title('Domínio [0, 255]')

f = r*2^16;
c = 1/log(1+2^16);
s_3 = c*log(1+f);
subplot(2,2,4), imshow(s_3);
title('Domínio [0, 65535]')

%%6) Transformação de alargamento de contraste (variando E)
r = im2double(imgTire);
m = mean2(r);

figure
subplot(2,2,1), imshow(imgTire)
title('Imagem Original')

E = 4;
e4=1./(1+(m./(r+eps)).^E);
subplot(2,2,2),imshow(e4)
title('E = 4')

E = 5;
e5 = 1./(1+(m./(r+eps)).^E);
subplot(2,2,3),imshow(e5)
title('E = 5')

E = 10;
e10 = 1./(1+(m./(r+eps)).^E);
subplot(2,2,4), imshow(e10)
title('E = 10')

%%7) Transformação de alargamento de contraste (variando m)
r = im2double(imgTire);

E = 4;
figure, subplot(2,2,1), imshow(imgTire),
title('Imagem Original')

m = .2;
m2 = 1./(1+(m./(r+eps)).^E);
subplot(2,2,2),imshow(m2), title('m = 0.2')

m = .5;
m5 = 1./(1+(m./(r+eps)).^E);
subplot(2,2,3),imshow(m5), title('m = 0.5')

m = .7;
m7 = 1./(1+(m./(r+eps)).^E);
subplot(2,2,4), imshow(m7), title('m = 0.7')
