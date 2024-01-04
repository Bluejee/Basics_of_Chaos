# This uses code from the physical pendulum program which is put through a loop
# To create the bifurcation diagram of F vs Theta for driver periods from 
# 300 to 400 To let the initial transients fade away.




clc;
clear;
format long e
close all;
set(0, 'defaultfigurevisible', 'on')

a = clock

#  This will be a 2 dimensional list with each column representing values of theta
# at periodic intervals from the 300th to 400th period.
Bifurcation_Theta_list = [];
# we will then plot each column with its corresponding Fd values
Fd_list = [];
step = round((1.5-1.35)/0.001)

for F = 1.35:0.001:1.5
  tic
  Fd_list = [Fd_list,F];
  
  w = [0];
  theta = [0.2];
  t = [0];
  l = 9.8;
  g = 9.8;
  dt = 3*pi/600; # i.e. every 600th value would be 1 driver period 
  Omega = 2/3;
  q = 1/2;
  
  i = 1;
  # We have to make sure that the computed values of t contains information 
  # atleast upto the 400th period value. i.e. till t = 2*400*pi/Omega.
  while t(i)<= (2*400*pi/Omega) + 1 # Plus 1 just to be on the safe side :P LOL
    w(i+1) = w(i)+(((-g/l).*sin(theta(i)) - q.*w(i) + F .* sin(Omega .* t(i))).*dt);
    theta(i+1) = theta(i) + (w(i+1).*dt);
    
    t(i+1) = t(i) + dt;
    if theta(i+1) > pi
      theta(i+1) -= 2*pi;
    endif
    
    if theta(i+1) < -pi
      theta(i+1) += 2*pi;
    endif
    i += 1;
  endwhile
  
  # Now we have a list of theta and t for the corresponding F
  # We now use the algorythem similer to that in poincare map to select points,
  # From 300th to 400th time period.
  # we can select values at multiples of 600
  n = 1;
  for j = (300*601):600:i
    Periodic_theta(n) = theta(j);
    n += 1;
  endfor
  
  Bifurcation_Theta_list = [Bifurcation_Theta_list,Periodic_theta'];
  step -= 1
  toc
endfor

b = clock
c = b-a

Bifurcation_Theta_list;
Fd_list;

plot(Fd_list, Bifurcation_Theta_list,'r.')

figure 2;
plot(Fd_list, Bifurcation_Theta_list,'r')

##
##figure 3;
##plot(poinlist_theta2,poinlist_w2,'r.')
##title('Phase-Space Poincare Plot', "fontsize", 15)
##xlabel('\Theta', "fontsize", 15)
##ylabel('\omega', "fontsize", 15)