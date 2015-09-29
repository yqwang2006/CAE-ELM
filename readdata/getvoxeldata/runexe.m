file=dir('*.off');
voxelLabel = zeros(length(file),1);

voxelData = zeros(4096,length(file));

for n = 1:length(file)
    filename = file(n).name;
    [V,F,UV,C,N] = readOFF( filename );
    V = V - repmat(mean(V,1),size(V,1),1);

    FV.faces = F;
    FV.vertices = V;

    Volume=polygon2voxel(FV,[16 16 16],'auto');
    voxelData(:,n) = reshape(double(Volume),4096,1);
    
    if strncmp(file(n).name,'airplane',3)
        voxelLabel(n) = 1;
    elseif strncmp(file(n).name,'bathtub',3)
        voxelLabel(n) = 2;
    elseif strncmp(file(n).name,'bed',3)
        voxelLabel(n) = 3;
    elseif strncmp(file(n).name,'bench',3)
        voxelLabel(n) = 4;
    elseif strncmp(file(n).name,'bookshelf',3)
        voxelLabel(n) = 5;
    elseif strncmp(file(n).name,'bottle',3)
        voxelLabel(n) = 6;
    elseif strncmp(file(n).name,'bowl',3)
        voxelLabel(n) = 7;
    elseif strncmp(file(n).name,'car',3)
        voxelLabel(n) = 8;
    elseif strncmp(file(n).name,'chair',3)
        voxelLabel(n) = 9;
    elseif strncmp(file(n).name,'cone',3)
        voxelLabel(n) = 10;
    elseif strncmp(file(n).name,'cup',3)
        voxelLabel(n) = 11;
    elseif strncmp(file(n).name,'curtain',3)
        voxelLabel(n) = 12;
    elseif strncmp(file(n).name,'desk',3)
        voxelLabel(n) = 13;
    elseif strncmp(file(n).name,'door',3)
        voxelLabel(n) =14;
    elseif strncmp(file(n).name,'dresser',3)
        voxelLabel(n) = 15;
    elseif strncmp(file(n).name,'flower_pot',3)
        voxelLabel(n) = 16;
    elseif strncmp(file(n).name,'glass_box',3)
        voxelLabel(n) = 17;
    elseif strncmp(file(n).name,'guitar',3)
        voxelLabel(n) = 18;
    elseif strncmp(file(n).name,'keyboard',3)
        voxelLabel(n) = 19;
    elseif strncmp(file(n).name,'lamp',3)
        voxelLabel(n) = 20;
    elseif strncmp(file(n).name,'laptop',3)
        voxelLabel(n) = 21;
    elseif strncmp(file(n).name,'mantel',3)
        voxelLabel(n) = 22;
    elseif strncmp(file(n).name,'monitor',3)
        voxelLabel(n) = 23;
    elseif strncmp(file(n).name,'night_stand',3)
        voxelLabel(n) = 24;
    elseif strncmp(file(n).name,'person',3)
        voxelLabel(n) = 25;
    elseif strncmp(file(n).name,'piano',3)
        voxelLabel(n) = 26;
    elseif strncmp(file(n).name,'plant',3)
        voxelLabel(n) = 27;
    elseif strncmp(file(n).name,'radio',3)
        voxelLabel(n) = 28;
    elseif strncmp(file(n).name,'range_hood',3)
        voxelLabel(n) = 29;
    elseif strncmp(file(n).name,'sink',3)
        voxelLabel(n) = 30;
    elseif strncmp(file(n).name,'sofa',3)
        voxelLabel(n) = 31;
    elseif strncmp(file(n).name,'stairs',3)
        voxelLabel(n) = 32;
    elseif strncmp(file(n).name,'stool',3)
        voxelLabel(n) = 33;
    elseif strncmp(file(n).name,'table',3)
        voxelLabel(n) =34;
    elseif strncmp(file(n).name,'tent',3)
        voxelLabel(n) = 35;
    elseif strncmp(file(n).name,'toilet',3)
        voxelLabel(n) = 36;
    elseif strncmp(file(n).name,'tv_stand',3)
        voxelLabel(n) = 37;
    elseif strncmp(file(n).name,'vase',3)
        voxelLabel(n) = 38;
    elseif strncmp(file(n).name,'wardrobe',3)
        voxelLabel(n) = 39;
    elseif strncmp(file(n).name,'xbox',3)
        voxelLabel(n) = 40;
    else
        voxelLabel(n) = 1;
    end
    
end
save modelnet40_voxelset.mat voxelData voxelLabel;