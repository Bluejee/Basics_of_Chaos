clear;
tic()
data = importdata('Poincare_xv_Chaotic.dat');

data_size= size(data);
len = data_size(1); % Number of Rows
plot_rows = [1:1:len]; % Default all rows
marker_size_scalar = 2; % 1 by default decrease to plot with smaller points

scatter(data(plot_rows,1),data(plot_rows,2),marker_size_scalar,'b','filled')

title('Poincare Map')
xlabel('x')
ylabel('v')
%legend('')
set(gca,"fontsize", 20)


% Taking the sum of all values of theta for a given Fd
% column 3 will contain count of the number of theta recorded
% newdata = [];
% newdata(1,:) = data(1,:);
% j = 1;
% for i = 2:len
%     if newdata(j,1) ==  data(i,1)
%         newdata(j,2) = newdata(j,2) + data(i,2);    
%     else
%         j = j + 1;
%         newdata(j,1) = data(i,1);
%         newdata(j,2) = data(i,2);
%     end        
% end
% 
% figure(2)
% plot(newdata(:,1),newdata(:,2))

toc()

