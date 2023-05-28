clear all ; close all ; clc;

im = imread("circuit.tif");

im = double(im); % in pixel doman
%kernel = ones(15,15)/(15*15);%convolution kernel
kernel = [0 1 0 ; 1 -4 1 ; 0 1 0];

figure
subplot(2,3,1), imshow(uint8(im)); 


fft_im = fft2(im); 
fft_kernel = fft2(kernel,678,906);% low-pass
fft_kernel2 = 1 - fft_kernel; %high-pass

fft_out = fft_im .* fft_kernel2 ;

out = ifft2(fft_out); %in pixel
subplot(2,3,6), imshow(uint8(out));

%to visualize only
subplot(2,3,3), imshow(log(abs(fftshift(fft_im))+1),[]);
subplot(2,3,4), imshow(log(abs(fftshift(fft_kernel2))+1),[]);
subplot(2,3,5), imshow(log(abs(fftshift(fft_out))+1),[]);

