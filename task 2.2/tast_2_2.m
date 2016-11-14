load('WP.mat');

x = WP(1,:);
y = WP(2,:);

% Plot waypoints and desired path
plot(x,y,'o',x,y)

% Switch axes and reverse
view(-90,90);
set(gca,'ydir','reverse');

title('Path generation');
xlabel('East [y]');
ylabel('North [x]');
asdf = legend('Waypoints','Piece-wise contionus interpolation','Location','SouthEast');
set(asdf,'FontSize',12);

% Initialisere
xPos = 1500;
yPos = 500;

% Plot vessel
hold on;
rectangle('Position',[1500 500 300 70]);
hold off;

% Find closest waypoint
closestWaypoint = 0;
leastDistance = Inf;

for waypoint=1:length(x)
    distance = sqrt(abs(x(waypoint)-xPos)^2 + abs(y(waypoint)-yPos)^2);
    if distance < leastDistance
        closestWaypoint = waypoint;
        leastDistance = distance;
    end
end

% ---------     Get next waypoint

% The vessel is closer to the waypoint than 500m, heading towards the next
if sqrt((x(1)-xPos)^2 + (y(1)-yPos)^2) < 500
    % Deleting the visited waypoint
    WP(:,1) = [];
end

x = WP(1,:);
y = WP(2,:);

if isempty(x)
    disp('Visited all waypoints');
end

xWaypoint = x(1);
yWaypoint = y(1);

% -----------   Find angle to that waypoint

% Move vessel to orgio, and the waypoint accordingly
xDistance = xWaypoint-xPos;
yDistance = yWaypoint-yPos;

% Finn vinkelen mot det punktet
psiD = atan2(xDistance,yDistance);
if psiD < 0
    psiD = psiD + 2 * pi;
end

disp(psiD*180/pi);

% Viss punkt innen 500m unna skip, vinkel til neste punkt
