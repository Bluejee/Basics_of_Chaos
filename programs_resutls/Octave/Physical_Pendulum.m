% In this one Theta doesnt approximate sine theta and we have other factors 
% such as damping and driving force. 
clc;
clear;
format long e
close all;
set(0, 'defaultfigurevisible', 'on')

w = [0];
theta = [0.2];
w2 = w;
theta2 = theta;
t = [0];
l = 9.8;
g = 9.8;
dt = 0.04;
F = 0;
Omega = 2/3;
q = 1/2;
% This only uses the Euler Cromer methods
% for refference reffer Giordano pg 48 and above.
hold on;
i = 1
while t(i)<=1
  t(i)
  %plot(theta(i), sin(theta(i)),'r.')
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
  i += 1;
endwhile
%[theta(:,1)-theta2(:,1)]
%[w(:,1)-w2(:,1)]
%plot([-1,1],[-1,1],'b')

[theta2,(theta2<-pi)];
hold on;
subplot(2,1,1)
plot(t(:,1),theta2(:,1),'b')

title('\theta Constrained between -\pi and \pi')
xlabel('Time(s)')
ylabel('Theta(\theta)')
set(gca,"fontsize", 20)

subplot(2,1,2)
plot(t(:,1),theta(:,1),'r')
title('\theta Not Constrained')
xlabel('Time(s)')
ylabel('Theta(\theta)')
set(gca,"fontsize", 20)

figure(5)
plot(t(:,1),theta2(:,1),'b;Fd = 1.465;')
title('Space-Time Plot')
xlabel('Time(s)')
ylabel('Theta(\theta)')
legend()
set(gca,"fontsize", 20)

% Coment from here

figure(2)
plot(theta2(:,1),w2(:,1),'r.;Fd = 0.5;')
title('Phase-Space Plot')
xlabel('Theta(\theta)')
ylabel('Angular Velocity(\omega)')
legend()
set(gca,"fontsize", 20)

poin_t(1) = 2*pi/Omega;
%%
%%n = 1;
%%while poin_t(n) <= max(t)
%%  poin_t(n+1) = 2*(n+1)*pi/Omega;
%%  n +=1;
%%endwhile
%%poin_t = poin_t'

n = 1;
for i = 1:length(t)
  if abs(t(i) - (2*n*pi/Omega)) < (dt/2)
    poinlist_t(n) = t(i);
    poinlist_theta2(n) = theta2(i);
    poinlist_w2(n) = w2(i);
    n += 1;
  endif
endfor 
poinlist_t';
%%
%%figure 2;
%%hold on
%%plot(theta2,w2,'r')
%%plot(theta2(poinlist_t),w2(poinlist_t),'go')
%%
%%title('Phase-Space Plot')
%%xlabel('\theta')
%%ylabel('\omega')


figure 3;
plot(poinlist_theta2,poinlist_w2,'r.;Fd = 1.2;')
title('Poincare Map in the chaotic regime')
xlabel('\theta')
ylabel('\omega')
legend()
set(gca,"fontsize", 20)

[poinlist_theta2',poinlist_w2'];


% Trial to see poincare and phase space together
figure 4;
hold on;
plot(theta2(:,1),w2(:,1),'r.')
plot(poinlist_theta2,poinlist_w2,'b.')






%%%% A random trial to animate the pendulum
%%pause()
%%x = l*sin(theta2);
%%y = -l*cos(theta2);
%%Animate_Pendulum(l,x,y,t,dt)
%%
