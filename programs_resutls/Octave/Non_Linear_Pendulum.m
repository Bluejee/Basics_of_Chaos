clc;
clear;
format long e

w = [0,0,0];
theta = [0.5,2,3]
w2 = [0,0,0]
theta2 =[(pi/2),(pi/3),(pi/4)]
t = [0,0,0];
l = 1;
g = 9.8;
dt = 0.001;

% This only uses the Euler Cromer methods
% for refference reffer Giordano pg 48 and above.
hold on;
for i = 1:10000
  w(i+1,:) = w(i,:)-((g/l).*sin(theta(i,:)).*dt);
  theta(i+1,:) = theta(i,:) + (w(i+1,:).*dt);
  t(i+1,:) = t(i,:) + dt;

end

t
hold on;

plot(t(:,1),theta(:,1),'r;\theta_0 = 0.5;')
plot(t(:,2),theta(:,2),'g;\theta_0 = 2;')
plot(t(:,3),theta(:,3),'b;\theta_0 = 3;')

title('Comparison of Initial Conditions for Non-Linear Pendulum', "fontsize", 15)
xlabel('Time', "fontsize", 15)
ylabel('Theta', "fontsize", 15)
legend()

figure(3)
hold on;
plot(theta(:,1),w(:,1),'r;\theta_0 = 0.5;')
plot(theta(:,2),w(:,2),'g;\theta_0 = 2;')
plot(theta(:,3),w(:,3),'b;\theta_0 = 3;')

title('Phase-Space Comparison of Initial Conditions for Non-Linear Pendulum', "fontsize", 15)
xlabel('Theta(\theta)', "fontsize", 15)
ylabel('Angular Velocity(\omega)', "fontsize", 15)
legend()

% To plot the different intial conditions for the linear pendulum
w = [0,0,0];
theta = [0.5,2,3]
t = [0,0,0];
l = 1;
g = 9.8;
dt = 0.001;
figure(2)
hold on;
for i = 1:10000
  w(i+1,:) = w(i,:)-((g/l).*(theta(i,:)).*dt); % note that only sin is missing.
  theta(i+1,:) = theta(i,:) + (w(i+1,:).*dt);
  t(i+1,:) = t(i,:) + dt;
end


plot(t(:,1),theta(:,1),'r;\theta_0 = 0.5;')
plot(t(:,2),theta(:,2),'g;\theta_0 = 2;')
plot(t(:,3),theta(:,3),'b;\theta_0 = 3;')

title('Comparison of Initial Conditions for Linear Pendulum', "fontsize", 15)
xlabel('Time', "fontsize", 15)
ylabel('Theta', "fontsize", 15)
legend()

figure(4)
hold on;
plot(theta(:,1),w(:,1),'r;\theta_0 = 0.5;')
plot(theta(:,2),w(:,2),'g;\theta_0 = 2;')
plot(theta(:,3),w(:,3),'b;\theta_0 = 3;')

title('Phase-Space Comparison of Initial Conditions for Linear Pendulum', "fontsize", 15)
xlabel('Theta(\theta)', "fontsize", 15)
ylabel('Angular Velocity(\omega)', "fontsize", 15)
legend()