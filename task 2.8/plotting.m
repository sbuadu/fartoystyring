% 
% plot(pos.Data(:,2), pos.Data(:,1));
% axis equal;
% grid on;
% hold on;
% 
% x = WP(1,:);
% y = WP(2,:);
% 
% % Plot waypoints and desired path
% plot(y,x,'o',y,x);
% 
% plot(P(:,2), P(:,1));
% plot(targetPos(:,2), targetPos(:,1));
% 
% title('Path following', 'Interpreter', 'latex');
% xlabel('$East [y]$', 'Interpreter', 'latex');
% ylabel('$North [x]$', 'Interpreter', 'latex');
% legend = legend('MS Fartoystyring', 'Waypoints','Desired path','Location','SouthEast');
% set(legend,'FontSize',12);
% %hold off;
% 
% 
% figure
% plot(sqrt((targetPos(:,1)-P(:,1)).^2 + (targetPos(:,2)-P(:,2)).^2)) %Plots distance between ships
% title('Distance between MS Fartøystyring and target', 'Interpreter', 'latex');
% xlabel('$Time [t]$', 'Interpreter', 'latex');
% ylabel('$Distance [m]$', 'Interpreter', 'latex');



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
legend('\delta_c', 'saturation limit'); 
xlabel('$Time [s]$','Interpreter', 'latex');
ylabel('$Angle [deg]$','Interpreter', 'latex');

%ploting closed loop  shaft speed behaviour
figure
hold on 
sat = (85*2*pi/60)*ones(length(n_c), 1); 
plot(n_c); 
plot(sat ,'k--'); 
plot(-sat, 'k--'); 

title('Closed loop shaft speed behavoiur', 'Interpreter', 'latex'); 
legend('n_c', 'saturation limit'); 
xlabel('$Time [s]$','Interpreter', 'latex');
ylabel('$Shaft speed [rad/s]$','Interpreter', 'latex');