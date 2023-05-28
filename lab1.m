close all ; % closes all figures
clear all ; % clears all variables
clc; % clears command window

in = imread("darkPollen.jpg"); %reading image 
in = double(in) %return to image 2D array

[rows, cols] = size(in) %corresponding values attach to rows and columns

M = rows * cols ; %number of pixels
L = 256; % gray levels in 8 bit representation

%histogram
h = zeros(1,L);

for i = 1 : rows    %take each value in(array)  
    for j  = 1:cols
        pix = in(i , j)
        h(pix +1) = h(pix+1)+1; % crucial point matlab indexing starts at 1 then add to h(histogram)array
    end
end    

figure; stem(h); title("Histogram");
%PMF
p = h/M ; % to finding probability mass function value
%figure; stem(p); title("Probability Density Function");

%CMF
c = zeros (1 , L); % initiate zeros array L lenght long
for i = 1:L
    c(i) = sum(p(1:i)); %Cumulative summation then add c(array) 
end

%figure ; stem(c); title("Cumulative Mass Function");

%Transfer function
t = round(c*255);
figure; stem(t); title("Transfer Function");

%Apply transfer function
out = zeros(rows,cols);
for i = 1:rows
    for j = 1:cols
        pix = in(i , j); % First image arrays' value attach to pix 
        out(i,j) = t(pix+1); % when pix+1 value pair with t array indexs then add into corresponding out(i,j) index
    end
end

in = uint8(in);
out = uint8(out);

%figure; imshow(in); 
%figure; imshow(out);% showing image
%subplot(121); imshow(in); title("Input Image")
%subplot(122); imshow(out); title("Output Image")

ho = zeros(1 , L); 
for i = 1:rows
    for j = 1:cols
        pix = out(i , j);
        ho(pix+1) = ho(pix+1)+1;
    end
end

%figure; stem(ho); title("New Image Histogram"); %new image histogram


