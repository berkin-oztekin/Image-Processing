clear; close all; clc;

imRGB = imread('lenna_RGB.tif');
imHSV = rgb2hsv(imRGB);
imYUV = rgb2ycbcr(imRGB);

R = imRGB(:,:,1); Rnew = histeq(R);
G = imRGB(:,:,2); Gnew = histeq(G);
B = imRGB(:,:,3); Bnew = histeq(B);

imRGBnew = cat(3,Rnew,Gnew,Bnew);
H = imHSV(:,:,1);
S = imHSV(:,:,2);
V = imHSV(:,:,3); Vnew = histeq(V);

imHSVnew = cat(3,H,S,Vnew);
imHSVnew_RGB = hsv2rgb(imHSVnew);

Y = imYUV(:,:,1); Ynew = histeq(Y);
U = imYUV(:,:,2);
V = imYUV(:,:,3);

imYUVnew = cat(3,Ynew,U,V);
imYUVnew_RGB = ycbcr2rgb(imYUVnew);

figure;
subplot(1,3,1); imshow(imRGBnew); title('Processing in RGB');
subplot(1,3,2); imshow(imHSVnew_RGB); title('Processing in HSV');
subplot(1,3,3); imshow(imYUVnew_RGB); title('Processing in YcbCr');

