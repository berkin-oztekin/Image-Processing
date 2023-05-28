clear all;
close all;
clc;


im = imread("moon.tif");

im = double(im);

kernel= [0 1 0 ;1 -4 1 ; 0 1 0 ];

enhanced_matlab = uint8(im - conv2(im,kernel,"same"));


im_p = padarray(im , [1,1],"symmetric");
[rows , cols] = size(im_p);
out_p =zeros(rows , cols);

for i =2:rows-1 
    for j = 2:cols-1
        neigh = im_p(i-1:i+1,j-1:j+1);
        out_p(i,j) = sum(neigh .* kernel,"all");
    end
end
out = out_p(2:rows-1,2:cols-1);
figure; imshow(out,[]);

enhanced = im - out ;
figure; imshow(uint8([im enhanced enhanced_matlab]));
