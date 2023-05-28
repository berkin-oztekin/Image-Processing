function out = myMedFilt(in,fs)

%That script has smilar code between Avarage Filtrating , we will sort the
%elements  so we don't need kernel there 
in = double(in);

pS= (fs-1)/2;

in_p = padarray(in ,[pS pS], "symmetric"); %padding

[rows,cols] = size(in_p);

out_p = zeros(rows , cols);

for i = pS+1:rows-pS
    for j =pS+1:cols-pS
        neighborhood = in_p(i-pS:i+pS,j-pS:j+pS);
        out_p(i,j) = median(neighborhood,"all"); % sorting the elements' neighborhoods then we will take the median  
    end
end

out = out_p(pS+1:rows-pS,pS+1:cols-pS); %unpadding