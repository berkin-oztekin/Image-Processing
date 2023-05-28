clear all;
close all;
clc;


im= imread("hubble_orig.tif");
im = double(im);

out1 = myAvgFilt(im,15);
out2 = zeros(size(out1));
out2(out1>60) = 255 ; 

subplot(121); imshow(uint8(out1)); title("Matlab Avarage Filt Out");
subplot(122); imshow(uint8(out2)); title("Matlab Med Filt Out");

%im= imread("board.tif");
%im = double(im);

%out2 = myMedFilt(im , 15);

%fs=15;
%kernel = ones(fs,fs)/(fs*fs); %simple averaging

%out1_matlab = conv2(im,fs,"same");
%out2_matlab = medfilt2(im ,[15 15]);


%figure;
%subplot(121); imshow(uint8(im)); title("Input");
%subplot(122); imshow(uint8(out1)); title("Output");

%subplot(223); imshow(uint8(out1_matlab)); title("Matlab Avarage Filt Out");
%subplot(224); imshow(uint8(out2_matlab )); title("matlab Med Filt Out");