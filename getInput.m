function layerInput = getInput(convFeature,param,inputfeaturemaps,model)
    sampleNum = size(convFeature,4);

    featureNum = size(convFeature,5);
    hidDim = size(convFeature,1);
    kernelDim = param.kernelDim;
    inptudim = hidDim+kernelDim-1;
    layerInput = zeros(inptudim,inptudim,inptudim,sampleNum);
    for j = 1:inputfeaturemaps
        for i = 1:featureNum
            layerInput(:,:,:,:,j) = layerInput(:,:,:,:,j) + convn(convFeature(:,:,:,:,i),model.kernel(:,:,:,j,i),'full');
        end
        layerInput(:,:,:,:,j) = layerInput(:,:,:,:,j) ./ featureNum;
    end
    %layerInput = squeeze(layerInput);
end