
%Ploting the desired vs real heading 
figure; 
hold on;
plot(u_d_plot.Time, u_d_plot.Data); 
plot(u_plot.Time, u_plot.Data); 
hold off; 
grid on;
title('u and $u_d$', 'Interpreter', 'latex'); 
legend('u_d','u'); 
xlabel('Time'); 
ylabel('[m/s]'); 

%Ploting the heading error 
figure;
plot(e_u_plot.Time, e_u_plot.Data); 
grid on; 
title('$\tilde{u}$', 'Interpreter', 'latex'); 
xlabel('Time'); 
ylabel('[m/s]'); 

