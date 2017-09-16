x = -5:0.1:5;
y = sigmoid(x);
plot(x,y,'r**')

xlabel('x')
ylabel('sigmoid(x)')
title('Sigmoid Function')

legend('sigmoid')