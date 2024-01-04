clc;
clear;
format long e
% 
% x0 = -0.19;
% C = 0.0173;
% x = -2.0;
% dx = 0.0001;
% del = sin(2 * pi * abs(x0)) + sin(4 * pi * abs(x0))
% v_list = [];
% x_list = [];
% 
% while(x<2)
%   v = C - ((sin(2 * pi * (x - x0)) + (0.25 * sin(4 * pi * (x - x0)))) / (4 * (pi^2) * del));
%   
%   v_list = [v_list;v];
%   x_list = [x_list;x];
%   
%   x = x + dx;
% end
% 
% 
% plot(x_list,v_list,'r')
% 
% title('Dimensionless Ratchet Potential','fontsize',15)
% xlabel('x','fontsize',20)
% ylabel('V','fontsize',20)

t = [0:0.001:12];
a1 = 0.074;
a2 = 0.081;
a3 = 0.0805;
w = 0.67;


F_a1 = a1*cos(w*t);
F_a2 = a2*cos(w*t);
F_a3 = a3*cos(w*t);

figure(2)
hold on;
plot(t,F_a1)
plot(t,F_a2)
plot(t,F_a3)

title('Dimensionless Driving Force','fontsize',15)
xlabel('t','fontsize',20)
ylabel('F','fontsize',20)
legend('a = 0.074','a = 0.081','a = 0.805')
