function H_arr = CAE_getH( data, model, param )
%CAE_FF Summary of this function goes here
%   Detailed explanation goes here
out = data;

if(length(size(out))==3)
    sampleNum = size(out,4);
elseif(length(size(out))==4)
    sampleNum = size(out,4);
elseif(length(size(out))==5)
    sampleNum = size(out,4);
end

[out,model] = convLayer(out,model,param);

% [maxvalue maxindex] = max(max(max(out)));
% 
% addpath('util');
% 
% data_index = [900 901 902 903 904];
% 
% num_visfea = 2;
% loc = zeros(length(data_index),num_visfea,3);
% 
% descend_i = zeros(param.featuremapsNum,length(data_index));
% for n = 1:length(data_index)
%     v_list = zeros(param.featuremapsNum,1);
%     i_list = zeros(param.featuremapsNum,3);
%     
%     for i = 1:param.featuremapsNum
%         A = out(:,:,:,data_index(n),i);
%         A = squeeze(A);
%         [v1,i1]=max(A);
%         [v2,i2]=max(v1);
%         [v3,i3]=max(v2);
%         i1 = squeeze(i1);
% 
%         v_list(i) = v3;
%         i_list(i,:) = [i1(i2(i3),i3) i2(i3) i3];
% 
%     %     dis_cube = data(index(1):index(1)+5,index(2):index(2)+5,index(3):index(3)+5,data_index(n));
%     %     data_cube = zeros(size(data,1),size(data,2),size(data,3));
%     %     data_cube(index(1):index(1)+5,index(2):index(2)+5,index(3):index(3)+5)=dis_cube;
%     %     show_sample(data_cube);
%     end
%     
%     [descend_val,descend_i(:,n)] = sort(v_list,'descend');
%     i_list = i_list(descend_i(:,n),:);
%     
%     loc(n,:,:) = i_list(1:num_visfea,:);
% end
% loc = permute(loc,[2 3 1]);
% 
% 
% out = out(:,:,:,data_index,:);
%save featuemaps.mat out -v7.3;
out = poolLayer(param.pooldim,out);

for j = 1:param.featuremapsNum
    H_arr{j} = out(:,:,:,:,j);
    outdim = size(out,1);
    H_arr{j} = squeeze(H_arr{j});
    H_arr{j} = reshape(H_arr{j},outdim*outdim*outdim,sampleNum);
    %H_arr{j} = reshape(H_arr{j},outdim,outdim,outdim,sampleNum);
end

end

