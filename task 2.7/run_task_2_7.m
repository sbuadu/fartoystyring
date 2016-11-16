%% Information
% This file is only an example of how you can start the simulation. The
% sampling time decides how often you store states. The execution  time
% will increase if you reduce the sampling time.

% Please note that the file "pathplotter.m" (only used in the second part
% of the assignment) shows the ship path during the path following and path
% tracking part of the assignment. It can be clever to adjust the sampling
% time when you use that file because it draws a sketch of the ship in the
% North-East plane at each time instant. Having a small sampling time will
% lead to a lot over overlap in the ship drawing.

% Note that pathplotter gives an error message if the simulation time is
% so large that the ship moves past the final waypoint. Therefore, it is
% important that you choose a simulation time that ensures that the
% simulation is finished when the ship is close to the final waypoint.

% You should base all of your simulink models on the MSFartoystyring model
% and extend that as you solve the assignment. For your own sake, it is
% wise to create a new model and run file for each task. That is
% especially important in the problems you need to hand in since the files
% you deliver only should create the desired result in that task.

% The msfartoystyring.m file includes the ship model. You are not allowed
% to change anything within that file. You need to include that file in
% every folder where you have a simulink model based on
% "MSFartoystyring.mdl".

% WP.mat is a set of five waypoints that you need to use in the second part of
% the assignment. The north position is given in the first row and the east
% position in the second row.



close all; 
clear; 
clc; 
%%

%Constants used to transform from radians to degrees
deg2rad = pi/180;
rad2deg = 180/pi;

tstart=0;      % Sim start time
tstop=5200;    % Sim stop time
tsamp=10;      % Sampling time for how often states are stored. (NOT ODE solver time step)

p0=[1500 500]; % Initial position (NED)
v0=[6.63 0]';  % Initial velocity (body)
psi0=150*deg2rad;        % Inital yaw angle
r0=0;          % Inital yaw rate
c=1;           % Current on (1)/off (0)

%Declaring the gains for the heading controller
K_ppsi = 3; %Proportional gain
K_ipsi = 3; %Integral gain
K_dpsi = 2; %Derivative gain

%Declaring the gains for the speed controller
K_pu = 18; %Proportional gain
K_iu = 9^2; %Integral gain
K_du = 0; %Derivative gain
        
load('WP.mat')

sim MSFartoystyring2_7 % The measurements from the simulink model are automatically written to the workspace.

plot(pos.Data(:,2), pos.Data(:,1));
axis equal;
grid on;
hold on;

x = WP(1,:);
y = WP(2,:);

% Plot waypoints and desired path
plot(y,x,'o',y,x);

title('Path Following with Crab angle Compensation');
xlabel('East [y]');
ylabel('North [x]');
legend = legend('MS Fartoystyring', 'Waypoints','Desired path','Location','SouthEast');
set(legend,'FontSize',12);