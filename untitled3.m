clear all ; 
close all ; 
clc;

im = imread("pattern.tif");
%out = imnoise(im , "salt & pepper",0.50);
%out = imnoise(im , "gaussian",0,0.01);
out = imnoise(im , 'poisson');

figure;
subplot(121); imshow(im);
subplot(122); imshow(out);


figure;
subplot(121); imhist(im);
subplot(122); imhist(out);


