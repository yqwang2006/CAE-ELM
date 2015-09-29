file=dir('*.txt');
testdata = zeros(4096,length(file));
testlabels = zeros(length(file),1);
for n = 1:length(file)
    if strncmp(file(n).name,'airplane',3)
        testlabels(n) = 1;
    elseif strncmp(file(n).name,'bathtub',3)
        testlabels(n) = 2;
    elseif strncmp(file(n).name,'bed',3)
        testlabels(n) = 3;
    elseif strncmp(file(n).name,'bench',3)
        testlabels(n) = 4;
    elseif strncmp(file(n).name,'bookshelf',3)
        testlabels(n) = 5;
    elseif strncmp(file(n).name,'bottle',3)
        testlabels(n) = 6;
    elseif strncmp(file(n).name,'bowl',3)
        testlabels(n) = 7;
    elseif strncmp(file(n).name,'car',3)
        testlabels(n) = 8;
    elseif strncmp(file(n).name,'chair',3)
        testlabels(n) = 9;
    elseif strncmp(file(n).name,'cone',3)
        testlabels(n) = 10;
    elseif strncmp(file(n).name,'cup',3)
        testlabels(n) = 11;
    elseif strncmp(file(n).name,'curtain',3)
        testlabels(n) = 12;
    elseif strncmp(file(n).name,'desk',3)
        testlabels(n) = 13;
    elseif strncmp(file(n).name,'door',3)
        testlabels(n) =14;
    elseif strncmp(file(n).name,'dresser',3)
        testlabels(n) = 15;
    elseif strncmp(file(n).name,'flower_pot',3)
        testlabels(n) = 16;
    elseif strncmp(file(n).name,'glass_box',3)
        testlabels(n) = 17;
    elseif strncmp(file(n).name,'guitar',3)
        testlabels(n) = 18;
    elseif strncmp(file(n).name,'keyboard',3)
        testlabels(n) = 19;
    elseif strncmp(file(n).name,'lamp',3)
        testlabels(n) = 20;
    elseif strncmp(file(n).name,'laptop',3)
        testlabels(n) = 21;
    elseif strncmp(file(n).name,'mantel',3)
        testlabels(n) = 22;
    elseif strncmp(file(n).name,'monitor',3)
        testlabels(n) = 23;
    elseif strncmp(file(n).name,'night_stand',3)
        testlabels(n) = 24;
    elseif strncmp(file(n).name,'person',3)
        testlabels(n) = 25;
    elseif strncmp(file(n).name,'piano',3)
        testlabels(n) = 26;
    elseif strncmp(file(n).name,'plant',3)
        testlabels(n) = 27;
    elseif strncmp(file(n).name,'radio',3)
        testlabels(n) = 28;
    elseif strncmp(file(n).name,'range_hood',3)
        testlabels(n) = 29;
    elseif strncmp(file(n).name,'sink',3)
        testlabels(n) = 30;
    elseif strncmp(file(n).name,'sofa',3)
        testlabels(n) = 31;
    elseif strncmp(file(n).name,'stairs',3)
        testlabels(n) = 32;
    elseif strncmp(file(n).name,'stool',3)
        testlabels(n) = 33;
    elseif strncmp(file(n).name,'table',3)
        testlabels(n) =34;
    elseif strncmp(file(n).name,'tent',3)
        testlabels(n) = 35;
    elseif strncmp(file(n).name,'toilet',3)
        testlabels(n) = 36;
    elseif strncmp(file(n).name,'tv_stand',3)
        testlabels(n) = 37;
    elseif strncmp(file(n).name,'vase',3)
        testlabels(n) = 38;
    elseif strncmp(file(n).name,'wardrobe',3)
        testlabels(n) = 39;
    elseif strncmp(file(n).name,'xbox',3)
        testlabels(n) = 40;
    else
        testlabels(n) = 1;
    end
    tmp = load(file(n).name);
    testdata(:,n) = tmp;
end
save testdataset.mat testdata testlabels;
