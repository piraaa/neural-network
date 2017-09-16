x = [0,0,1,1;...
     0,1,0,1]

w = [ 2,  2;...
     -2, -2];

h = [1; -3];

u = [2, 2];

g = 3;

z = formal_neuron1(x,w,h);
y = formal_neuron1(z,u,g)