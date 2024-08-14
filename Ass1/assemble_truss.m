function global_stiffness = assemble_truss(connectivity, angles, stiffness_values, num_nodes)
    dof_per_node = 2;
    total_dofs = num_nodes * dof_per_node;
    
    % Initialize global stiffness matrix
    global_stiffness = zeros(total_dofs, total_dofs);
    
    % Loop over each element
    for i = 1:size(connectivity, 1)
        node1 = connectivity(i, 1);
        node2 = connectivity(i, 2);
        angle = angles(i);
        ke = stiffness_values(i);
        
        % Convert angle to radians
        theta = deg2rad(angle);
        c = cos(theta);
        s = sin(theta);
        
        % Local stiffness matrix for the element
        k_local = ke * [
            c*c,  c*s, -c*c, -c*s;
            c*s,  s*s, -c*s, -s*s;
           -c*c, -c*s,  c*c,  c*s;
           -c*s, -s*s,  c*s,  s*s
        ];
        
        % Indices for the global stiffness matrix
        dof_indices = [
            (node1-1)*dof_per_node + 1, (node1-1)*dof_per_node + 2, ...
            (node2-1)*dof_per_node + 1, (node2-1)*dof_per_node + 2
        ];
        
        % Assemble local stiffness into global stiffness matrix
        global_stiffness(dof_indices, dof_indices) = global_stiffness(dof_indices, dof_indices) + k_local;
    end
end
