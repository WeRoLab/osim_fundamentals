% Kathryn Forrest, Wuyuqing Yang, Cara G. Welker, and Edgar Bolívar-Nieto
% April 2022

clc, clearvars, close all

% Input parameters
maxVel = 50;    %Maximum velocity of the position trajectory [RPM]
maxPos = 45;    %Maximum amplitude of the position trajectory [Deg.]
offPos = 50;    %Offset of position [Deg.]
timExp = 60;    %Time for the Chirp signal [Seconds]
samRat = 1e-3;  %Sample rate [Seconds]
timSte = 5;     %Time with constant reference to set ini. conditions [Sec.]

% Auxiliary functions
rpm2rps = @(x) x/60*(2*pi); %Convert RPMs to rad. per sec.
rps2rpm = @(x) x/(2*pi)*60; %Convert rad. per sec. to RPM
deg2rad = @(x) x/180*pi;    %Convert deg. to rad.
rad2deg = @(x) x/pi*180;    %Convert rad. to deg.

% Generate trajectories
tim = (0: samRat: timExp);
ome = rpm2rps(maxVel)/deg2rad(maxPos);  %Target frequency omega

omeVec = linspace(0, ome, length(tim));    %Vector of target frequencies

% Trajectories!
qKnee  = deg2rad(maxPos)*cos(omeVec.*tim) + deg2rad(offPos);
qdKnee = -deg2rad(maxPos)*omeVec.*sin(omeVec.*tim);
% Append constant reference to set initial conditions
timApp = (0: samRat: timSte);                       %Time to append
tim    = [timApp, tim+timApp(end)+samRat];          
qKnee  = [ones(1, length(timApp))*deg2rad(offPos + maxPos), qKnee];   
qdKnee = [zeros(1, length(timApp)), qdKnee];

% Sample plot
figure, title('Reference Trajectory'), yyaxis left, hold on, grid on
plot(tim, rad2deg(qKnee))
ylabel('Position [Deg.]')
yyaxis right
plot(tim,rps2rpm(qdKnee))
ylabel('Velocity [RPM]')
xlabel('Time [Sec.]')

% Export to .csv file
writematrix([tim.', qKnee.', qdKnee.'], 'RefTrajectories.csv')