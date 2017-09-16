xdata = [0,0,0,0,1,1,1,1;...
         0,0,1,1,0,0,1,1;...
         0,1,0,1,0,1,0,1];

trains = [0,1,1,0,1,0,0,1];

w = 0.1*randn(3,3);
b = 0.1*randn(3,1);

u = 0.1*randn(1,3);
c = 0.1*randn(1,1);

sample_num=8;  % Number of Training samples
CYCLE=100000;  % Trainig cycles
LAMBDA=0.1;

for cycle=1:CYCLE
  for n=1:sample_num
    x = xdata(:,n);
    y = sigmoid_neuron(x,w,b);
    z = sigmoid_neuron(y,u,c);
    t = trains(:,n);
    
    delta_out = (z-t).*(z.*(1-z));
    delta_hidden = (delta_out'*u)'.*(y.*(1-y));
    
    du = delta_out*y';
    dc = -1 * delta_out;
    dw = delta_hidden * x';
    db = -1 * delta_hidden;
    
    u=u-LAMBDA*du;
    c=c-LAMBDA*dc;
    w=w-LAMBDA*dw;
    b=b-LAMBDA*db;
  end
end

w
b
u
c

ys = sigmoid_neuron(xdata,w,b);
zs = sigmoid_neuron(ys,u,c)
cost = cost_function(zs,trains)