clear;
tic()
data = importdata('Poincare_xv_Period4.dat');
data2 = importdata('Poincare_xv_Chaotic.dat');
data_size= size(data);
len = data_size(1); % Number of Rows
plot_rows = [1:1:len]; % Default all rows
marker_size_scalar = 80; % 1 by default decrease to plot with smaller points

data_size2= size(data2);
len2 = data_size2(1); % Number of Rows
plot_rows2 = [1:1:len2]; % Default all rows
marker_size_scalar2 = 2; % 1 by default decrease to plot with smaller points




hold on;

scatter(data2(plot_rows2,1),data2(plot_rows2,2),marker_size_scalar2,'b','filled')
scatter(data(plot_rows,1),data(plot_rows,2),marker_size_scalar,'r','filled')

title('Poincare Map')
xlabel('x')
ylabel('v')
legend('Chaotic','Period-4')
set(gca,"fontsize", 20)
