%チュートリアル

%2次元および3次元プロット
x = 0:pi/100:2*pi;
y = sin(x);
plot(x,y)

xlabel('x')
ylabel('sin(x)')
title('Plot of the Sine Function')

%plot(x,y,'r--')

hold on

y2 = cos(x);
plot(x,y2,':')
legend('sin','cis')

hold off

[X,Y] = meshgrid(-2:.2:2);
Z = X .* exp(-X.^2 - Y.^2);
surf(X,Y,Z)

t = 0:pi/10:2*pi;
[X,Y,Z] = cylinder(4*cos(t));
subplot(2,2,1); mesh(X); title('X');
subplot(2,2,2); mesh(Y); title('Y');
subplot(2,2,3); mesh(Z); title('Z');
subplot(2,2,4); mesh(X,Y,Z); title('X,Y,Z');