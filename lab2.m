close all ; % closes all figures
clear all ; % clears all variables
clc; % clears command window


im = imread("breast_Xray.tif");
im = double(im); 

[rows , cols ] = size(im); % initilize array columns and rows 

out = zeros(rows , cols); %intilize new zeros array

for i = 1 : rows
    for j = 1:cols
        pix = im(i , j);
        out(i , j) = 255 - pix;
    end
end

%neg = 255 - im ; % same as upper implementation 

figure;
subplot(131); imshow(uint8(im));title('Input Image');
subplot(132); imshow(uint8(out));title('Negatif Image');

im = imread("moon.tif");
im = double(im); 

[rows , cols ] = size(im); % initilize array columns and rows 

out1 = zeros(rows , cols); %intilize new zeros array



for i = 1 : rows
    for j = 1:cols
        pix = im(i , j);
            if pix > 150   % clipping if pixel value below the 150 
                out1(i , j) = 255 ;
            else
            out1(i , j) = 0 ; 
            end 
    end
end


%out2(im >10) = 255 ; % if pixel value under 10 value then clip every pixel value in array way more faster
%than upper implementation


figure;
subplot(131); imshow(uint8(im));title('Input Image');
subplot(132); imshow(uint8(out1));title('Threashold Image 1. Way');
%subplot(133); imshow(uint8(out2));title('Threashold Image 2. Way');


im = imread("DFT_no_log .tif");
im = double(im); 

[rows , cols ] = size(im);

out2 = zeros(rows , cols); 



for i = 1 : rows
    for j = 1:cols
        pix = im(i , j);
        out2(i ,j) = log(1+pix); %We are adding 1 because log0 is undifened
    end
end

figure;
subplot(131); imshow(uint8(im));title('Input Image');
subplot(132); imshow(out2 , []);title('Log Transformed'); % Resizeable needed because of eligible values are not in out2 array
%so used [] argument in imshow() function

im = imread("washed_aerial.tif");
im = double(im); 

[rows , cols ] = size(im);

out3 = zeros(rows , cols); 



for i = 1 : rows
    for j = 1:cols
        pix = im(i , j);
        out3(i ,j) = 255*((pix / 255)^6); % We normalized the pixel values then multiplying gamma coefficient 
    end
end

figure;
subplot(131); imshow(uint8(im));title('Input Image');
subplot(132); imshow(uint8(out3));title('Power Law Transformed');


