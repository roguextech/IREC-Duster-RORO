%% Main 
clear all; clc;

% Global varialbes
global roro
global env 
% Create rocket class

roro = rocket(init_rocket());% creates class with the initial values
%%
motor_init( roro ); %loads rocket motor
%%
% Initilize Environmental variables 
%To Do: read to do doc

env = environement();


%%
% Phase: Accent
tend=30;
[t, state] = accent_calc(roro,tend);

figure(1);
plot(t,state(:,3))
xlabel('Time(s)')
ylabel('Height (m)')

figure(2);
plot3(state(:,1),state(:,2),state(:,3))
xlabel('x(m)')
ylabel('y (m)')
zlabel('Height (m)')
axis([-500 500 -500 500 0 4000])


%%
