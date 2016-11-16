
plot(pos.Data(:,2), pos.Data(:,1));
axis equal;
grid on;
hold on;

x = WP(1,:);
y = WP(2,:);

% Plot waypoints and desired path
plot(y,x,'o',y,x);

title('Path generation');
xlabel('East [y]');
ylabel('North [x]');
legend = legend('MS Fartoystyring', 'Waypoints','Desired path','Location','SouthEast');
set(legend,'FontSize',12);