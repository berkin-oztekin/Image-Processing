close all ; % closes all figures
clear all ; % clears all variables
clc; % clears command window


im = imread("fractal_iris.tif");
im = double(im);
z = findSB(im);


function [f, m]  = findSB(n)
    LSB = bitget(n,1); %takes pixel values last bit LSB
    MSB = bitget(n,8);%takes pixel values first bit MSB
    m = figure; imshow(MSB); title("Most Significant Bit Image");
    f = figure; imshow(LSB);title("Least Significant Bit Image");
end

