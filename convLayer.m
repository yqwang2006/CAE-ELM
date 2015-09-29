function [ outputData,model] = convLayer( inputData,model, param )
%CONVLAYER Summary of this function goes here
%   Detailed explanation goes here
inputDim = size(inputData,1);

if(length(size(inputData))==5)
    inputFeatureMapNum = size(inputData,5);
    sampleNum = size(inputData,4);  %inputdata:四维数据，前两维表示单张的图像维度，第三维表示特征图的数目，第四维表示图片个数
else
    inputFeatureMapNum = 1;
    sampleNum = size(inputData,4);
    inputData = reshape(inputData,inputDim,inputDim,inputDim,sampleNum,1);
end
outputFeatureMapNum = param.featuremapsNum;

kernelDim = size(model.kernel,1);
featureMapDim = inputDim - kernelDim + 1;
outputData = zeros(featureMapDim,featureMapDim,featureMapDim,sampleNum,outputFeatureMapNum);

for i = 1:outputFeatureMapNum
    for j = 1:inputFeatureMapNum
        
        outputData(:,:,:,:,i) = outputData(:,:,:,:,i) + convn(inputData(:,:,:,:,j),model.kernel(:,:,:,j,i),'valid');
        
    end
end

end

