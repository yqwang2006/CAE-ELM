function pooledFeature = getPooledFeature(AEFeature,param,model)

sampleNum = size(AEFeature,4);
featureNum = size(AEFeature,5);
hidDim = size(AEFeature,1);
pooledFeature = zeros(hidDim,hidDim,hidDim,sampleNum,featureNum);
for i = 1:featureNum
    tmp = AEFeature(:,:,:,:,i);
    tmp = reshape(tmp,hidDim*hidDim*hidDim,sampleNum);
    tmp = Actfunc(model.W{i}'*tmp,param.Actfunc);
    pooledFeature(:,:,:,:,i) = reshape(tmp,hidDim,hidDim,hidDim,sampleNum);
end
    
    
end