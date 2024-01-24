clc; clear all; close all;
% Compare the performance of Gradient Descent, 
% Newton’s method and Simulated Annealing
% for minimising the following function:
% 𝑧 = 5(𝑦 − 𝑥^2)^2 + (3 − 𝑥)^2
% a) Write code to display a surface plot of this function.

[a,b] = meshgrid(-10:10,-10:10);
n = 5*(b-a.^2).^2 + (3-a).^2;
surf(a,b,n,"EdgeColor","texturemap","FaceAlpha",0.2)
hold on
% b) Write Matlab code to minimise the function using 
% gradient descent. Your code should ensure that the minimum 
% value on the surface plot is displayed.
clc;    
x(1) = 1; % initial value of x 
y(1) = 10; % initial value of y 
z(1) =  ((3-x(1)).^2) + (30.*(y(1)-(x(1).^2)).^2);
stepsize = 0.001;
for i = 1:1000
    dx = -2*(3-x(i))-20*x(i)*(y(i)-x(i).^2);
    dy = -10*(x(i).^2-y(i)); 
    x(i+1) = x(i) - stepsize*dx; %gradient descent 
    y(i+1) = y(i) - stepsize*dy;
    z(i+1) = ((3-x(i+1)).^2) + (30.*(y(i+1)-(x(i+1).^2)).^2);
    if abs(dx) < 1e-6 && abs(dy) < 1e-6
        break;
    end
end
plot3(x,y,z,'o','Markersize',3,'Color','red')
hold off
x(end)
y(end)