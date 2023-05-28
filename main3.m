clear all;
close all;
clc;


im = imread("contact_lens.tif");

im = double(im);

kernel1= [-1 -2 -1 ;0 0 0 ; 1 2 1];
kernel2= [-1 0 1 ;-2 0 2 ; -1 0 1];



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
figure; imshow(out1,[]);



out_p2 =zeros(rows , cols);
for i =2:rows-1 
    for j = 2:cols-1
        neigh = im_p(i-1:i+1,j-1:j+1);
        out_p2(i,j) = sum(neigh .* kernel2,"all");
    end
end
out2 = out_p2(2:rows-1,2:cols-1);
figure; imshow(out2,[]);

edge_im = abs(out1) + abs(out2);
figure; imshow(edge_im,[]);

edge_im_matlab = edge(im);
figure; imshow(edge_im_matlab);
%figure; imshow(uint8([im enhanced enhanced_matlab]));

edge_im_matlab2 = abs(conv2(im,kernel1,"same"))+abs(conv2(im,kernel2,"same"));
figure; imshow(edge_im_matlab2 , []);
