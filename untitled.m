clear all ; close all ; clc;

im = imread("circuit.tif");

im = double(im);
kernel = ones(15,15)/(15*15);

im_a = conv2(im , kernel , 'same');
figure
subplot(2,3,1), imshow(uint8(im));
subplot(2,3,2), imshow(uint8(im_a));

fft_im = fft2(im); 
fft_kernel = fft2(kernel,678,906);
fft_out = fft_im .* fft_kernel ;

out = ifft2(fft_out); %in pixel
subplot(2,3,6), imshow(uint8(out));

%to visualize only
subplot(2,3,3), imshow(log(abs(fftshift(fft_im))+1),[]);
subplot(2,3,4), imshow(log(abs(fftshift(fft_kernel))+1),[]);
subplot(2,3,5), imshow(log(abs(fftshift(fft_out))+1),[]);

