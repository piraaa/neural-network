filename = '0.bmp';
image = imread(filename);
image = cast(image,'double')./255;
image = reshape(image,[784,1]);
ys = sigmoid_neuron(image,w,b);
zs = sigmoid_neuron(ys,u,c);
[M,I] = max(zs);
result = I-1