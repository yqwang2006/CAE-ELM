file=dir('*.off');

for n = 1:length(file)
    filename = file(n).name;
    mycmd = ['SDFGen.exe ' file(n).name];
    system(mycmd);
end
