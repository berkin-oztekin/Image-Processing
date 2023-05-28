clear all;
close all;
clc;

im = imread("lenna_RGB.tif");
figure;
subplot(2,2,1); imshow(im); title('RGB')
subplot(2,2,2); imshow(im(:,:,1)); title('R')
subplot(2,2,3); imshow(im(:,:,2)); title('G')
subplot(2,2,4); imshow(im(:,:,3)); title('B')


im_hsv = rgb2hsv(im);
figure;
subplot(2,2,1); imshow(im_hsv); title('HSV')
subplot(2,2,2); imshow(im_hsv(:,:,1),[]); title('H')
subplot(2,2,3); imshow(im_hsv(:,:,2),[]); title('S')
subplot(2,2,4); imshow(im_hsv(:,:,3)); title('V')

im_yuv = rgb2ycbcr(im);

figure;
subplot(2,2,1); imshow(im_yuv); title('YUV')
subplot(2,2,2); imshow(im_yuv(:,:,1),[]); title('Y')
subplot(2,2,3); imshow(im_yuv(:,:,2),[]); title('U')
subplot(2,2,4); imshow(im_yuv(:,:,3)); title('V')