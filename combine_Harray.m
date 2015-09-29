function H = combine_Harray(out)
H = [];
featuresNum = size(out,5);
sampleNum = size(out,4);
H_dim = size(out,1);
for i = 1:featuresNum
    H_tmp = out(:,:,:,:,i);
    H_tmp = squeeze(H_tmp);
    H_tmp = reshape(H_tmp,H_dim*H_dim*H_dim,sampleNum);
    H = [H;H_tmp]; 
end

end