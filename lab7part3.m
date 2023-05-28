clear all ; 
close all ; 
clc

im = imread('text_gaps.tif');
figure ;
subplot(121); imshow(im); title('Input Image');

SE = strel("square",3);

im2 = imerode(im,SE);
im3 = imdilate(im2,SE);

im4 = imdilate(im3,SE);
im5 = imerode(im4,SE);

subplot(122); imshow(im5); title('Output Image');
