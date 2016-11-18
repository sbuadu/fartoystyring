%ploting closed loop surge speed behaviour
figure 
hold on
plot(u_d, 'r--')
plot(U(:,1))
title('Closed loop surge speed behaviour', 'Interpreter', 'latex'); 
legend('U_d', 'U'); 
xlabel('$Time [s]$','Interpreter', 'latex');
ylabel('$Speed [\frac{m}{s}]$','Interpreter', 'latex');

%ploting closed loop heading behaviour
figure
hold on 
plot(psi_d*rad2deg, 'r--'); 
plot(psi*rad2deg); 
title('Closed loop heading behavoiur', 'Interpreter', 'latex'); 
legend('\psi_d', '\psi'); 
xlabel('$Time [s]$','Interpreter', 'latex');
ylabel('$Heading [deg]$','Interpreter', 'latex');

%ploting closed loop rudder behaviour
figure
hold on 
plot(delta_c*rad2deg); 
sat = 25*ones(length(delta_c), 1); 
plot(sat ,'k--'); 
plot(-sat, 'k--'); 
title('Closed loop rudder behavoiur', 'Interpreter', 'latex'); 
legend('\delta_c', 'saturation limit', 'saturation limit'); 
xlabel('$Time [s]$','Interpreter', 'latex');
ylabel('$Angle [deg]$','Interpreter', 'latex');

%ploting closed loop  shaft speed behaviour
figure
hold on 
sat = (85*2*pi/60)*ones(length(n_c), 1); 
plot(sat ,'k--'); 
plot(-sat, 'k--'); 
plot(n_c); 
title('Closed loop shaft speed behavoiur', 'Interpreter', 'latex'); 
legend('n_c', 'saturation limit', 'saturation limit'); 
xlabel('$Time [s]$','Interpreter', 'latex');
ylabel('$Shaft speed [rad/s]$','Interpreter', 'latex');


%generating plot to all angles
figure
hold on 
grid on 
plot(beta*rad2deg); 
plot(x*rad2deg); 
plot(x_d*rad2deg, '--'); 
plot(psi*rad2deg); 
title('Angle comparison', 'Interpreter', 'latex'); 
legend('\beta', '\chi', '\chi_d', '\psi', 'Interpreter', 'latex'); 
xlabel('s', 'Interpreter', 'latex'); 
ylabel( '[deg]', 'Interpreter', 'latex'); 