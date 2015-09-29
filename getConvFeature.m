function convFeature = getConvFeature(pooledFeature,param,model)
    sampleNum = size(pooledFeature,4);
    featureNum = size(pooledFeature,5);
    pooleddim = size(pooledFeature,1);
    poolsize = param.pooldim;
    hidDim = size(pooledFeature,1)*param.pooldim;
    convFeature = zeros(hidDim,hidDim,hidDim,sampleNum,featureNum);
    for i = 1:featureNum
        for j = 1:sampleNum
            tmp = pooledFeature(:,:,:,j,i);
            for j1 = 1:pooleddim
                for j2 = 1:pooleddim
                    for j3 = 1:pooleddim
                        val = tmp(j1,j2,j3)/(poolsize*poolsize*poolsize);
                        convFeature(((j1-1)*poolsize+1):(j1*poolsize),((j2-1)*poolsize+1):j2*poolsize,((j3-1)*poolsize+1):j3*poolsize,j,i) = repmat(val,[poolsize,poolsize,poolsize]);
                    end
                end
            end
        end
    end
end