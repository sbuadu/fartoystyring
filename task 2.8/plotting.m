
plot(pos.Data(:,2), pos.Data(:,1));
axis equal;
grid on;
hold on;

x = WP(1,:);
y = WP(2,:);

% Plot waypoints and desired path
plot(y,x,'o',y,x);

plot(P(:,2), P(:,1));
plot(targetPos(:,2), targetPos(:,1));

title('Path following', 'Interpreter', 'latex');
xlabel('$East [y]$', 'Interpreter', 'latex');
ylabel('$North [x]$', 'Interpreter', 'latex');
legend = legend('MS Fartoystyring', 'Waypoints','Desired path','Location','SouthEast');
set(legend,'FontSize',12);
%hold off;


figure
plot(sqrt((targetPos(:,1)-P(:,1)).^2 + (targetPos(:,2)-P(:,2)).^2)) %Plots distance between ships
title('Distance between MS Fart�ystyring and target', 'Interpreter', 'latex');
xlabel('$Time [t]$', 'Interpreter', 'latex');
ylabel('$Distance [m]$', 'Interpreter', 'latex');