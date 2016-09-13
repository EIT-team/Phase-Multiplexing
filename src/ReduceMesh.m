function [ indicies_to_keep] = ReduceMesh( Mesh, max_z, max_distance )

%REDUCEMESH Takes a mesh (with .vtx and .tri) and returns elements within a
%max_distance of the centre, and with height of +/- max_z or less
%   Detailed explanation goes here

indicies_to_keep = [];
for i = 1:size(Mesh.tri,1)
    distance = max(sqrt(Mesh.vtx(Mesh.tri(i,:),2).^2+Mesh.vtx(Mesh.tri(i,:),1).^2));
    z_position = max(abs(Mesh.vtx(Mesh.tri(i,:),3)));
    if (z_position <  max_z && distance < max_distance)
        indicies_to_keep(end+1) = i;
    end
    
end


end

