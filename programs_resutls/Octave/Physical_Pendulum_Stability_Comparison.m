# In this one Theta doesnt approximate sine theta and we have other factors 
# such as damping and driving force. 
clc;
clear;
format long e
close all;
set(0, 'defaultfigurevisible', 'on')

w = [0];
theta = [0.2];
w2 = w;
theta2 = [0.199];
t = [0];
l = 9.8;
g = 9.8;
dt = 0.01;
F = 1.2;
Omega = 2/3;
q = 1/2;
# This only uses the Euler Cromer methods
# for refference reffer Giordano pg 48 and above.
hold on;
i = 1
while t(i)<=150
  #plot(theta(i), sin(theta(i)),'r.')
  w(i+1,:) = w(i,:)+(((-g/l).*sin(theta(i,:)) - q.*w(i) + F .* sin(Omega .* t(i))).*dt);
  theta(i+1,:) = theta(i,:) + (w(i+1,:).*dt);
  
  w2(i+1,:) = w2(i,:)+(((-g/l).*sin(theta2(i,:)) - q.*w2(i) + F .* sin(Omega .* t(i))).*dt);
  theta2(i+1,:) = theta2(i,:) + (w2(i+1,:).*dt);
  
  t(i+1,:) = t(i,:) + dt;
  
  if theta2(i+1,:) > pi
    theta2(i+1,:) -= 2*pi;
  endif
  
  if theta2(i+1,:) < -pi
    theta2(i+1,:) += 2*pi;
  endif
  
  if theta(i+1,:) > pi
    theta(i+1,:) -= 2*pi;
  endif
  
  if theta(i+1,:) < -pi
    theta(i+1,:) += 2*pi;
  endif
  
  i += 1;
endwhile


figure 1;
hold on;
subplot(2,1,1)
plot(t(:,1),theta2(:,1),'b')
title('\Theta_0 = 0.201', "fontsize", 15)
xlabel('Time', "fontsize", 15)
ylabel('Theta2', "fontsize", 15)

subplot(2,1,2)
plot(t(:,1),theta(:,1),'r')
title('\Theta_0 = 0.2', "fontsize", 15)
xlabel('Time', "fontsize", 15)
ylabel('Theta', "fontsize", 15)


delta_theta = abs(theta2 - theta);
#[theta2,theta,delta_theta]

figure 2;

semilogy(t(:,1),delta_theta(:,1),'r')

title('\Delta\Theta_0 vs Time', "fontsize", 15)
xlabel('Time', "fontsize", 15)
ylabel('\Delta\Theta', "fontsize", 15)


##
#### A random trial to animate the pendulum
##pause()
##x = l*sin(theta2);
##y = -l*cos(theta2);
##Animate_Pendulum(l,x,y,t,dt)

