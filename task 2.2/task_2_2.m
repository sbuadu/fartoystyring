function psiD = task_2_2(xPos, yPos, WP)

% Testrun: task_2_2(0,0);

asdfasdf = 2;

%load('WP.mat');

vesselPos = [xPos yPos];

if evalin( 'base', 'exist(''nextWaypointIndex'',''var'') == 0' )
    previousWaypointIndex = 1;
    nextWaypointIndex = 2;
else
    previousWaypointIndex = 1;
    nextWaypointIndex = 2;
end

% The vessel is closer to the waypoint than 500m, heading towards the next
if sqrt((xWP(nextWaypointIndex)-vesselPos(1))^2 + (yWP(nextWaypointIndex)-vesselPos(2))^2) < 500
    previousWaypointIndex = nextWaypointIndex;
    nextWaypointIndex = newtWaypointIndex + 1;
    if nextWaypointIndex > length(xWP)
        disp('Reach goal');
    end

end

previousWaypoint = [xWP(previousWaypointIndex) yWP(previousWaypointIndex)];
nextWaypoint = [xWP(nextWaypointIndex) yWP(nextWaypointIndex)];

%disp(previousWaypoint);
%disp(nextWaypoint);


% Get normalized vektor of the line
v = (nextWaypoint - previousWaypoint);
v_norm = v/norm(v);

% Find closest point on path
dot1 = dot(vesselPos-nextWaypoint,v_norm);
dot2 = dot(v_norm,v_norm);

closestPoint = nextWaypoint + dot1/dot2 * v_norm;
%disp(closestPoint);

% Find point on path 500m ahead of closest point
aimPoint = closestPoint + 500*v_norm;
disp(aimPoint);

% -----------   Find angle to that waypoint

% Move vessel to orgio, and the waypoint accordingly
% Find the angle to the point
psiD = atan2(aimPoint(1)-vesselPos(1),aimPoint(2)-vesselPos(2));
if psiD < 0
    psiD = psiD + 2 * pi;
end

disp(psiD*180/pi);


%%%%%%% Plotting (for ? sjekke at det er riktig)

x = xWP;
disp(WP);
y = yWP;
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


end
