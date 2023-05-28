function out = myAvgFilt(in ,fs)
%assume square neighborhoods
%fs odd integer


kernel = ones(fs,fs)/(fs*fs); %simple avareging kernel and normalizing

in = double(in);
pS= (fs-1)/2;   %if fs= 3 we need to pad one pixel

in_p = padarray(in ,[pS pS], "symmetric"); %padding , we pad required number of pixels left , right , bottom , up on columns and rows 

[rows,cols] = size(in_p); %using paded image

out_p = zeros(rows , cols);

for i = pS+1:rows-pS % we already pad the image so that we start pS+1 also rows-pS needed
    for j =pS+1:cols-pS % using same operation (line 16)
        neighborhood = in_p(i-pS:i+pS,j-pS:j+pS);
        out_p(i,j) = round(sum(neighborhood .* kernel , "all")); %elementwise multiplation of neighborhood and sum then round the value
    end
end

out = out_p(pS+1:rows-pS,pS+1:cols-pS); %unpadding the output