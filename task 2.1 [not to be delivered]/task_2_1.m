load('WP.mat');

x = WP(1,:);
y = WP(2,:);

x_axis = [0 1 0];

startX = x(5);
endX = x(1);

alpha = zeros(2,length(x));
beta = zeros(2,length(x));
gamma = zeros(2,length(x));

x_diff = zeros(1,length(x));
y_diff = zeros(1,length(x));

R = [0 700 700 700 0];
Rdash = zeros(1,length(x));

for i = 2:length(x)-1
    u = [x(i+1)-x(i) y(i+1)-y(i) 0];
    v = [x(i-1)-x(i) y(i-1)-y(i) 0];
    sign = 1;
    if u(2) < 0
        sign = -1;
    end
    alpha = atan2(norm(cross(u,v)), dot(u,v))/2;
    beta = atan2(norm(cross(u,x_axis)), dot(u,x_axis));
    Rdash(i) = R(i)*tan(alpha);
    rdot = sqrt(R(i)^2 + Rdash(i)^2);
    x_diff(i) = sign * rdot * sin(alpha - sign * beta);
    y_diff(i) = rdot * cos(alpha - sign * beta);
end

t = startX:0.5:endX;
p = pchip(x,y,t);
s = spline(x,y,t);
set(gca,'XTick', 0:5:100);
plot(y,x,'o',p,t,'-',s,t,'-.',y,x)
title('Path generation');
xlabel('East [y]');
ylabel('North [x]');
asdf = legend('Waypoints','Hermite interpolant','Spline','Piece-wise contionus interpolation','Location','SouthEast');
set(asdf,'FontSize',12);
hold on;
rectangle('Position',[1000 300 70 300]);
hold off;
for i = 2:length(x)-1
    circle(y(i)+y_diff(i),x(i)+x_diff(i),Rdash(i));
end