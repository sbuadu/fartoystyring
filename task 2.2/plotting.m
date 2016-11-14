
%%%%%%% Plotting (for ? sjekke at det er riktig)

x = WP(1,:);
disp(WP);
y = WP(2,:);
% Plot waypoints and desired path
plot(x,y,'o',x,y);

% Switch axes and reverse
view(-90,90);
set(gca,'ydir','reverse');

title('Path generation');
xlabel('East [y]');
ylabel('North [x]');
asdf = legend('Waypoints','Piece-wise contionus interpolation','Location','SouthEast');
set(asdf,'FontSize',12);

% Plot vessel
hold on;
rectangle('Position',[vesselPos(2) vesselPos(1) 300 70]);
hold off;

% Plot aimpoint (500m)
hold on;
rectangle('Position',[aimPoint(1) aimPoint(2) 50 50]);
hold off;
