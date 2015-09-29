function AEFeature = getAEFeature(H,param)
    
    if length(size(H))==2
        sampleNum = size(H,2);
        featureNum = param.featuremapsNum;
        hidNum = param.hiddenNum;
        hidDim = nthroot(hidNum,3);
        AEFeature = zeros(hidDim,hidDim,hidDim,sampleNum,featureNum);

        for j = 1:featureNum
            tmp = H(hidNum*(j-1)+1:hidNum*j,:);
            AEFeature(:,:,:,:,j) = reshape(tmp,hidDim,hidDim,hidDim,sampleNum);
        end
    elseif length(size(H))==5
        AEFeature = H;
    end

end
