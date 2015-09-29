function show_sample(samples)
% a simple visualization tool using isosurface to show each 3D sample.
if (length(size(samples))==3)
    n = 1;
    the_sample = samples;
    figure;
    %plot3D(the_sample);
    p = patch(isosurface(the_sample,0.3));
    set(p,'FaceColor','red','EdgeColor','none');
    daspect([1,1,1])
    view(3); axis tight
    camlight 
    lighting gouraud;
    axis off;
    set(gcf,'Color','white');
else
    n = size(samples,1);
    for i = 1 : n
        the_sample = squeeze(samples(i,:,:,:,:));

        %the_sample = (the_sample-min(min(min(min(the_sample)))))./(max(max(max(max(the_sample))))-min(min(min(min(the_sample)))));

        figure;
        %plot3D(the_sample);
        p = patch(isosurface(the_sample,0.3));
        set(p,'FaceColor','red','EdgeColor','none');
        daspect([1,1,1])
        view(3); axis tight
        camlight 
        lighting gouraud;
        axis off;
        set(gcf,'Color','white');
        title(i);
     end
end

