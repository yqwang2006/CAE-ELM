function show3D(data, figNum)
sizeNum=size(data,1);
mesh=data;
%mesh=bb;
mesh(mesh>0.1)=0;
meshReshape = reshape(mesh, sizeNum,sizeNum,sizeNum);
Volume=meshReshape;
[X1,Y1,Z1]=ind2sub(size(Volume),find(Volume(:)));
plot3(X1,Y1,Z1,'.b');
% hold on;
% 
% mesh = data;
% mesh(mesh<=0.1 & mesh>0.2) = 0;
% meshReshape = reshape(mesh, sizeNum,sizeNum,sizeNum);
% Volume=meshReshape;
% [X2,Y2,Z2]=ind2sub(size(Volume),find(Volume(:)));
% plot3(X2,Y2,Z2,'.k');
% hold on;
% 
% mesh = data;
% mesh(mesh<=0.2 & mesh>0.3) = 0;
% meshReshape = reshape(mesh, sizeNum,sizeNum,sizeNum);
% Volume=meshReshape;
% [X3,Y3,Z3]=ind2sub(size(Volume),find(Volume(:)));
% plot3(X3,Y3,Z3,'.r');
% hold on;
% 
% mesh = data;
% mesh(mesh<=0.3 & mesh>0.4) = 0;
% meshReshape = reshape(mesh, sizeNum,sizeNum,sizeNum);
% Volume=meshReshape;
% [X4,Y4,Z4]=ind2sub(size(Volume),find(Volume(:)));
% %plot3(X1,Y1,Z1,'.y',X2,Y2,Z2,'.b',X3,Y3,Z3,'.r',X4,Y4,Z4,'.k');
% plot3(X4,Y4,Z4,'.r');
% hold off;



axis equal;
colormap(hsv)
colorbar

xlabel('x');
ylabel('y');
zlabel('z');


return