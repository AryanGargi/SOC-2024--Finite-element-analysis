% Define inputs
connectivity = [
    1, 2;
    2, 3;
    3, 4;
    4, 5;
    5, 6;
    1, 12;
    2, 12;
    2, 11;
    3, 11;
    3, 10;
    3, 9;
    4, 10;
    4, 9;
    4, 8;
    5, 8;
    5, 7;
    6, 7;
    12, 11;
    11, 10;
    10, 9;
    9, 8;
    8, 7;
  
];
angles = [
    0;
    0;
    0;
    0;
    0;
    90;
    127;
    90;
    127;
    90; 
    53;
    127;
    90;
    53;
    90;
    53;
    90;
    0;
    0;
    0;
    0;
    0;
   
];
stiffness_values = [
    150e9 * 0.01 / 3;  % EA/L for 1-2 element
    150e9 * 0.01 / 3;  % EA/L for 2-3 element
    150e9 * 0.01 / 3;  % EA/L for 3-4 element
    150e9 * 0.01 / 3;  % EA/L for 4-5 element
    150e9 * 0.01 / 3;  % EA/L for 5-6 element
    150e9 * 0.01 / 4;  % EA/L for 1-12 element
    150e9 * 0.01 / 5;  % EA/L for 2-12 element
    150e9 * 0.01 / 4;  % EA/L for 2-11 element
    150e9 * 0.01 / 5;  % EA/L for 3-11 element
    150e9 * 0.01 / 4;  % EA/L for 3-10 element
    150e9 * 0.01 / 5;  % EA/L for 3-9 element
    150e9 * 0.01 / 5;  % EA/L for 4-10 element
    150e9 * 0.01 / 4;  % EA/L for 4-9 element
    150e9 * 0.01 / 5;  % EA/L for 4-8 element
    150e9 * 0.01 / 4;  % EA/L for 5-8 element
    150e9 * 0.01 / 5;  % EA/L for 5-7 element
    150e9 * 0.01 / 4;  % EA/L for 6-7 element
    150e9 * 0.01 / 3;  % EA/L for 12-11 element
    150e9 * 0.01 / 3;  % EA/L for 11-10 element
    150e9 * 0.01 / 3;  % EA/L for 10-9 element
    150e9 * 0.01 / 3;  % EA/L for 9-8 element
    150e9 * 0.01 / 3;  % EA/L for 8-7 element

    
];
num_nodes = 12;  % Total number of nodes

% Call the function
global_stiffness = assemble_truss(connectivity, angles, stiffness_values, num_nodes);

% Display the result
disp('Global Stiffness Matrix:');
disp(global_stiffness);
