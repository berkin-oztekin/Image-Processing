clear all ; 
close all ; 
clc

im = imread('lincoln.tif');

figure ;
subplot(121); imshow(im); title('Input Image');

SE = strel("square" , 17);
out = im - imerode(im,SE);

subplot(122); imshow(out); title('Boundry');