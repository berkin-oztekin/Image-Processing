clear all ; 
close all ; 
clc

im = imread('fingerprint.tif');

figure ; 
subplot(231); imshow(im); title("Input Image");

SE = strel("square" , 3); %structurel element we have 3x3 frame 

im2 = imerode(im,SE); %erosion
subplot(232); imshow(im2); title("Eroded Image");

im3 = imdilate(im2,SE); %dilation 
subplot(233); imshow(im3); title("Eroded and Dilated Image");

im4 = imdilate(im3,SE);
subplot(234); imshow(im4); title("Eroded, Dilated and then Dilated Image");

im5 = imerode(im4,SE);
subplot(235); imshow(im5); title("Eroded, Dilated Dilated and then Erored Image");