pkg load image;

mnist = loadMNISTDataset();
clear -regexp ^(?!mnist$).

%montage(mnist.train_images(:, :, :, 1:56));

sample_num=500;     %%%%% Number of Training samples (MNIST has 60,000 Training samples)
test_num=500;

trains=zeros(10,sample_num); 
for n=1:sample_num
  xdata(:,:,1,n) = cast(mnist.train_images(:, :, 1, n), 'double')./255;
  trains(mnist.train_labels(n)+1, n) = 1.0;
end

tests=zeros(10,test_num); 
for n=1:test_num
  tdata(:,:,1,n) = cast(mnist.test_images(:, :, 1, n), 'double')./255;
  tests(mnist.test_labels(n)+1, n) = 1.0;
end

IU = 28*28;  % the number of input Units
HU = 10;     % the number of hidden units
OU = 10;     % the number of output units

xdata2 = reshape(xdata, IU, sample_num); %　MNIST imageを1次元配列に直したもの
tdata2 = reshape(tdata, IU, test_num);

w = 0.1*randn(HU,IU);
b = 0.1*randn(HU,1);

u = 0.1*randn(OU,HU);
c = 0.1*randn(OU,1);

EPOCH=50;  % The number of Trainig epochs
LAMBDA=0.1;

for epoch=1:EPOCH
  for n=1:sample_num

    %  Implement feed-forward calculation and back propagation.
    x = xdata(:,:,1,n);
    x = reshape(x,[IU,1]);
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

  % calculate current cost
  ys = sigmoid_neuron(tdata2,w,b);
  zs = sigmoid_neuron(ys,u,c);
  current_cost = sum(cost_function(zs,tests))/test_num;


  % Implement current cost calculation, 
  % and save the value to the array “cost(epoch)”.
  cost(epoch) = current_cost;

end

% Display the graph of cost changes
plot([1:epoch], cost)
title('Cost on the training data');
xlabel('Epoch');
ylabel('Cost');

% Calculate the correct answer rate
[M,I] = max(zs);
ansvecs = I' -1;
train_correct_rate = sum(ansvecs == mnist.train_labels(1:n))/n

% Test
for n=1:test_num
  ys = sigmoid_neuron(tdata2,w,b);
  zs = sigmoid_neuron(ys,u,c);
  end

% Calculate the correct answer rate
[M,I] = max(zs);
ansvecs = I' -1;
test_correct_rate = sum(ansvecs == mnist.test_labels(1:test_num))/test_num
