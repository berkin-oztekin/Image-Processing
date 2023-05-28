clc
clear all
close all

im = imread("region_filling.tif")

subplot(231); imshow(im);title('Original Image');

%Defining the structuring element
SE=[0 1 0;1 1 1;0 1 0];

%Take the complement of the original Image
acmp=~(im);

%Deside the strat point of hole and make that 1
[rows , cols ] = size(im); % initilize array columns and rows 

x = ones(rows , cols); %intilize new zeros array
x(46,102) = 0; 

y=(imdilate(x,SE) & acmp);

while(~isequal(x,y))
   x=y;
   y=(imdilate(x,SE) & acmp);
end


subplot(232); imshow(y);title('Region filling operation');

