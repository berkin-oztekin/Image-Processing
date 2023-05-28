clear all;
close all;
clc;

im = imread("skeleton_orig.tif");
im = double(im);

kernel = [0 1 0 ;1 -4 1 ; 0 1 0 ];
figure; imshow(im,[]);

im_p = padarray(im , [1 1],"symmetric");
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

sub_out = im - out ;
figure; imshow(sub_out,[]);

%******************************************
kernel1 = [-1 -2 -1 ;0 0 0 ;1 2 1 ];

im_p = padarray(im , [1 1],"symmetric");
[rows , cols] = size(im_p);
out_p1 =zeros(rows , cols);

for i =2:rows-1 
    for j = 2:cols-1
        neigh = im_p(i-1:i+1,j-1:j+1);
        out_p1(i,j) = sum(neigh .* kernel1,"all");
    end
end
out1 = out_p1(2:rows-1,2:cols-1);


kernel2 = [-1 0 1 ;-2 0 2;-1 0 1];

out_p2 =zeros(rows , cols);
for i =2:rows-1 
    for j = 2:cols-1
        neigh = im_p(i-1:i+1,j-1:j+1);
        out_p2(i,j) = sum(neigh .* kernel2,"all");
    end
end
out2 = out_p2(2:rows-1,2:cols-1);

edge_im = abs(out1) + abs(out2);
figure; imshow(edge_im,[]);

%*******************************

new_out = myAvgFilt(edge_im , 5);
figure; imshow(new_out,[]);

%*******************************
maskedImage = edge_im .* new_out ; 
figure; imshow(maskedImage,[]);

%*******************************
f = imfilter(im , kernel,"symmetric");
sharpendImage = f + im ; 
figure; imshow(sharpendImage, [])
%*******************************

im = sharpendImage;
im = double(im); 
[rows , cols ] = size(im);

power_lawed = zeros(rows , cols); 

for i = 1 : rows
    for j = 1:cols
        pix = im(i , j);
        power_lawed(i ,j) = 255*((pix / 60)^2); % We normalized the pixel values then multiplying gamma coefficient 
    end
end

figure; imshow(uint8(power_lawed));








