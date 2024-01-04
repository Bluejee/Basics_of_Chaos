# This uses code from the physical pendulum program which is put through a loop
# To create the bifurcation diagram of F vs Theta for driver periods from 
# 300 to 400 To let the initial transients fade away.


pkg load parallel


clc;
clear;
format long e
close all;
set(0, 'defaultfigurevisible', 'on')

a = clock

#  This will be a 2 dimensional list with each column representing values of theta
# at periodic intervals from the 300th to 400th period.
# we will then plot each column with its corresponding Fd values
Fd_list = linspace(1.35,1.5,10);


Bifurcation_Theta_list = pararrayfun(nproc-1, @Bifurcation_Parallel, Fd_list)


b = clock
c = b-a

plot(Fd_list, Bifurcation_Theta_list,'r.')

figure 2;
plot(Fd_list, Bifurcation_Theta_list,'r')

##
##figure 3;
##plot(poinlist_theta2,poinlist_w2,'r.')
##title('Phase-Space Poincare Plot', "fontsize", 15)
##xlabel('\Theta', "fontsize", 15)
##ylabel('\omega', "fontsize", 15)