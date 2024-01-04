clc;
clear;

close all;
set(0, 'defaultfigurevisible', 'on');

w = [0];
w2 = [0];
theta = [3.14/4];
theta2 = [3.14/4];
t = [0];
l = 2;
g = 9.8;
dt = 0.04;

% w2 and theta 2 is done by euler cramer methods.
% w and theta uses Eulers method.
% for refference reffer Giordano pg 48 and above.

for i = 1:500
  w(i+1) = w(i)-((g/l)*theta(i)*dt);
  w2(i+1) = w2(i)-((g/l)*theta2(i)*dt);
  theta(i+1) = theta(i) + (w(i)*dt);
  theta2(i+1) = theta2(i) + (w2(i+1)*dt);
  t(i+1) = t(i) + dt;
end

t;
theta;

plot(t,theta,'g;Eulers Method;')
hold on;
plot(t,theta2,'r;Euler Cromer Method;')

title('Comparison of Different Methods for Linear Pendulum', "fontsize", 15)
xlabel('Time', "fontsize", 20)
ylabel('Theta',"fontsize", 20)
legend()

figure(2)
plot(theta,w,'g;Euler Method;')
hold on;
plot(theta2,w2,'r;Euler Cromer Method;')
title('Phase-Space Plot for the linear pendulum', "fontsize", 15)
xlabel('Theta', "fontsize", 20)
ylabel('Angular Velocity(\omega)',"fontsize", 20)
legend()


%%%% A random trial to animate the pendulum
%%pause()
%%%theta2 = theta2 - (pi/2);
%%theta2(1)
%%x = l*sin(theta2);
%%y = -l*cos(theta2);
%%Animate_Pendulum(l,x,y,t,dt)

