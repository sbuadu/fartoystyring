
%Ploting the desired vs real heading 
figure; 
hold on;
plot(psi_d_plot.Time, psi_d_plot.Data*rad2deg); 
plot(psi_plot.Time, psi_plot.Data*rad2deg); 
hold off; 
grid on;
title('$\psi_d$ andange $\psi$', 'Interpreter', 'latex'); 
legend('\psi_d','\psi'); 
xlabel('Time'); 
ylabel('[deg]'); 

%Ploting the heading error 
figure;
plot(e_psi_plot.Time, e_psi_plot.Data*rad2deg); 
grid on; 
title('$\tilde{\psi}$', 'Interpreter', 'latex'); 
xlabel('Time'); 
ylabel('[deg]'); 

% Ploting the real vs desired yaw rate
figure; 
hold on; 
plot(r_d_plot.Time, r_d_plot.Data*rad2deg); 
plot(r_plot.Time, r_plot.Data*rad2deg); 
hold off; 
grid on; 
title('$r_d$ and r', 'Interpreter', 'latex')
legend('r_d', 'r')
xlabel('Time'); 
ylabel('[deg/s]');


% Plotting the yaw rate error
figure; 
plot(r_d_plot.time, (r_d_plot.Data- r_plot.Data)*rad2deg); 
grid on; 
title('$\tilde{r}$', 'Interpreter', 'latex')
xlabel('Time'); 
ylabel('[deg/s]');