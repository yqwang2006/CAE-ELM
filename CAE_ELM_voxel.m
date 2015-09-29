addpath('voxeldata');
%load stanford_train2_and_test1_voxel.mat;
load 16voxelSet.mat;


%  load modelnet40_voxelset.mat;
%  load modelnet40_testset.mat;


data=voxelData;
clear voxelData
labels=voxelLabel;
clear voxelLabel

shapedim = nthroot(size(data,1),3);

%data = data';
inputDim = shapedim; %sqrt(size(data,1));
sampleNum = size(data,2);
data = reshape(data,inputDim,inputDim,inputDim,sampleNum);

class_number = length(unique(labels));
labels(labels==0)=class_number;
T = full(sparse(labels,1:sampleNum,1));  %groundTruth [classnumber, samplenumber]


%单层， featuremapsNum=80,kerneldim=5,pooldim = 2,C=1e8，准确率达到86.1%


tic;

if(length(size(data))==5)
    inputFeatureMapNum = size(data,5);
    sampleNum = size(data,4);  %inputdata:四维数据，前两维表示单张的图像维度，第三维表示图片个数，第四维表示特征图的数目
else
    inputFeatureMapNum = 1;
    sampleNum = size(data,4);
end
for k = 1:layersNum
    outputFeatureMapNum = param{k}.featuremapsNum;
    model{k}.kernel = zeros(param{k}.kernelDim,param{k}.kernelDim,param{k}.kernelDim,inputFeatureMapNum,outputFeatureMapNum);
    hidden_size = param{k}.hiddenNum;
    inputDim =floor( (inputDim-param{k}.kernelDim+1)/param{k}.pooldim);
    %inputDim =(inputDim-param{k}.kernelDim+1);
    for i = 1:outputFeatureMapNum
        for j = 1:inputFeatureMapNum
            model{k}.kernel(:,:,:,j,i) = rand(param{k}.kernelDim,param{k}.kernelDim, param{k}.kernelDim)*2-1;
        end  
        model{k}.W{i} = rand(hidden_size,inputDim * inputDim* inputDim)*2-1;
        model{k}.b{i} = rand(hidden_size,1);
    end
    inputFeatureMapNum = outputFeatureMapNum;
    inputDim = nthroot(hidden_size,3);
end

% load filters.mat;
%  for i = 1:outputFeatureMapNum
%          model{k}.kernel(:,:,:,1,i) = filters(:,:,:,i);
% 
% end



out = data;
clear data
for l = 1:layersNum
    H_array = CAE_getH(out,model{l},param{l});
    for j = 1:param{l}.featuremapsNum
        %fprintf('training the %d th auto-encoder!\n',j);
        [out_arr{j},model{l}.W{j}] = AE_train(H_array{j},model{l}.W{j}, model{l}.b{j},param{l});
        %out_arr{j} = AE_ff(H_array{j},model{l}.W{j},model{l}.b{j},param{l}.Actfunc);
        %out_arr{j} = (out_arr{j}-min(min(min(min(out_arr{j})))))./(max(max(max(max(out_arr{j}))))-min(min(min(min(out_arr{j})))));
        
        if j == 1
            out = out_arr{j};
        else
            out = cat(5,out,out_arr{j});
        end
    end
end
clear H_array
clear H_tmp
clear out_arr;

H = combine_Harray(out);
clear out

save trainVoxelH.mat H;
%C = 0.01;

if sampleNum > param{1}.featuremapsNum*inputDim^3
    model{layersNum+1}.OutputWeight=inv(eye(size(H,1))/C+H * H') * H * T';
else
    model{layersNum+1}.OutputWeight=H*inv(eye(size(H,2))/C+H' * H) * T';
end

TY=(H' * model{layersNum+1}.OutputWeight)';
clear H

MissClassificationRate_Training=0;

predLabels = zeros(sampleNum,1);

for i = 1 : sampleNum
       
    [x, label_index_expected]=max(T(:,i));
    [x, label_index_actual]=max(TY(:,i));
    predLabels(i) = label_index_actual;
    if label_index_actual~=label_index_expected
         MissClassificationRate_Training=MissClassificationRate_Training+1;
    end
end
TrainingAccuracy=1-MissClassificationRate_Training/sampleNum

toc

%%%%%%%%%%%%%%%%%%%testing%%%%%%%%%%%%%%%%%%%%%%%%



data=testData;
labels=testLabel;
clear testData
clear testLabel



%data = data';
inputDim =shapedim; %sqrt(size(data,1));
sampleNum = size(data,2);
data = reshape(data,inputDim,inputDim,inputDim,sampleNum);

labels(labels==0)=class_number;
T = full(sparse(labels,1:sampleNum,1));  %groundTruth [classnumber, samplenumber]

out = data;
clear data
for l = 1:layersNum
    H_array = CAE_getH(out,model{l},param{l});
    for j = 1:param{l}.featuremapsNum
        out_arr{j} = AE_ff(H_array{j},model{l}.W{j},model{l}.b{j},param{l}.Actfunc);
        %out_arr{j} = (out_arr{j}-min(min(min(min(out_arr{j})))))./(max(max(max(max(out_arr{j}))))-min(min(min(min(out_arr{j})))));
        if j == 1
            out = out_arr{j};
        else
            out = cat(5,out,out_arr{j});
        end
    end
    
end
clear out_arr;
H = combine_Harray(out);
save testVoxelH.mat H;

clear out
TY=(H' * model{layersNum+1}.OutputWeight)';
save model40_TY_voxel.mat TY;
clear H

MissClassificationRate_Testing=0;

predLabels = zeros(sampleNum,1);

for i = 1 : sampleNum
       
    [x, label_index_expected]=max(T(:,i));
    [x, label_index_actual]=max(TY(:,i));
    predLabels(i) = label_index_actual;
    if label_index_actual~=label_index_expected
         MissClassificationRate_Testing=MissClassificationRate_Testing+1;
    end
end
TestingAccuracy=1-MissClassificationRate_Testing/sampleNum
save model40_predLabels_voxel.mat predLabels;



