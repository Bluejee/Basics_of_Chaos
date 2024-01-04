# In this one Theta doesnt approximate sine theta and we have other factors 
# such as damping and driving force. 
clc;
clear;
format long e

w = [0];
theta = [0.2];
w2 = w;
theta2 = theta;
t = [0];
l = 9.8;
g = 9.8;
dt = 0.04;
F = 1.2;
Omega = 2/3;
q = 1/2;
# This only uses the Euler Cromer methods
# for refference reffer Giordano pg 48 and above.
hold on;
i = 1
while t(i)<=60
  #plot(theta(i), sin(theta(i)),'r.')
  w(i+1,:) = w(i,:)+(((-g/l).*sin(theta(i,:)) - q.*w(i) + F .* sin(Omega .* t(i))).*dt);
  theta(i+1,:) = theta(i,:) + (w(i+1,:).*dt);
  
  w2(i+1,:) = w2(i,:)+(((-g/l).*sin(theta2(i,:)) - q.*w2(i) + F .* sin(Omega .* t(i))).*dt);
  theta2(i+1,:) = theta2(i,:) + (w2(i+1,:).*dt)
  
  t(i+1,:) = t(i,:) + dt;
  while theta2(i,:) > pi
    theta2(i,:) -= 2*pi
  endwhile
  
  while theta2(i,:) < -pi
    theta2
    theta2(i,:) += 2*pi
  endwhile
  i += 1;
endwhile
#[theta(:,1)-theta2(:,1)]
#[w(:,1)-w2(:,1)]
#plot([-1,1],[-1,1],'b')

[theta2,(theta2<-pi)];
hold on;
subplot(2,1,1)
plot(t(:,1),theta2(:,1),'b')
title('\Theta Constrained between -\Pi and \Pi', "fontsize", 15)
xlabel('Time', "fontsize", 15)
ylabel('Theta', "fontsize", 15)

subplot(2,1,2)
plot(t(:,1),theta(:,1),'r')
title('\Theta Not Constrained', "fontsize", 15)
xlabel('Time', "fontsize", 15)
ylabel('Theta', "fontsize", 15)
