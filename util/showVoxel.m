function showVoxel( Volume )
%SHOWVOXEL 此处显示有关此函数的摘要
%   此处显示详细说明
[X,Y,Z]=ind2sub(size(Volume),find(Volume(:)));
plot3(X,Y,Z,'.');
axis equal;
xlabel('x');
ylabel('y');
zlabel('z');
end

