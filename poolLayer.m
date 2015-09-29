function pooledFeatures = poolLayer(poolDim, convolvedFeatures)

% Parameters:
%  poolDim - dimension of pooling region
%  convolvedFeatures - convolved features to pool (as given by cnnConvolve)
%                      convolvedFeatures(imageRow, imageCol, featureNum, imageNum)
%
% Returns:
%  pooledFeatures - matrix of pooled features in the form
%                   pooledFeatures(poolRow, poolCol, featureNum, imageNum)
%     
% 
% numImages = size(convolvedFeatures, 4);
% numFilters = size(convolvedFeatures, 3);
% convolvedDim = size(convolvedFeatures, 1);
% 
% outputDim = convolvedDim / poolDim;
% 
% pooledFeatures = zeros(outputDim, outputDim, numFilters, numImages);
% 
% 
%     for numImage = 1:numImages
%         for numFeature = 1:numFilters
%             for poolRow = 1:outputDim
%                 offsetRow = 1+(poolRow-1)*poolDim;
%                 for poolCol = 1:outputDim
%                     offsetCol = 1+(poolCol-1)*poolDim;
%                     patch = convolvedFeatures(offsetRow:offsetRow+poolDim-1, ...
%                         offsetCol:offsetCol+poolDim-1,numFeature,numImage); %取出一个patch
%                     pooledFeatures(poolRow,poolCol,numFeature,numImage) = mean(patch(:));
%                 end
%             end            
%         end
%     end


numImages = size(convolvedFeatures, 4);
numFilters = size(convolvedFeatures, 5);
convolvedDim = size(convolvedFeatures, 1);

outputDim = floor(convolvedDim / poolDim);    
pooledFeatures=zeros(outputDim, outputDim,outputDim, numImages, numFilters);
    for k=1:numFilters
         z = convn(convolvedFeatures(:,:,:,:,k).^2, ones([poolDim poolDim poolDim]) , 'valid'); %用卷积实现重采样
         z = sqrt(z);
         HTemp= z(1 : poolDim : end, 1 : poolDim : end,  1 : poolDim : end, :);

         pooledFeatures(:,:,:,:,k) = HTemp;
         
    end

end

