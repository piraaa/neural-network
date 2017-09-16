x = [0,0,0,0,1,1,1,1;...
     0,0,1,1,0,0,1,1;...
     0,1,0,1,0,1,0,1];
y = [0,1,1,0,1,0,0,0];

w = 0.1*randn(3,3);
b = 0.1*randn(3,1);

u = 0.1*randn(1,3);
c = 0.1*randn(1,1);
     
o1 = sigmoid_neuron(x,w,b);
o = sigmoid_neuron(o1,u,c);

cost_function(o,y)