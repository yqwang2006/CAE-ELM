function output = CAE_ff( data, model, param )
%CAE_FF Summary of this function goes here
%   Detailed explanation goes here
if(length(size(data))==3)
    sampleNum = size(data,3);
elseif(length(size(data))==4)
    sampleNum = size(data,3);
elseif(length(size(data))==5)
    sampleNum = size(data,4);
end
H_arr = CAE_getH(data,model,param);

output = zeros(param.hiddenNum, sampleNum);

for j = 1:param.featuremapsNum
    output = output + Actfunc(model.W{j} * H_arr{j} + repmat(model.b{j},1,sampleNum),'sig');   
end

clear H_arr;
outputdim = sqrt(size(model.W{1},1));
if outputdim * outputdim ~= size(model.W{1},1)
    fprintf('The number of hidden nodes must be squre of an integer!\n');
end
output = reshape(output,outputdim,outputdim,sampleNum);
end

