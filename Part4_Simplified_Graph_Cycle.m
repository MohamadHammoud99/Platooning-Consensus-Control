
%% Part 4 : Simplified graph with less connections 
% ---> we propose the cycle graph of communication with one sense of flow of information
% Plot the new graph of the system (Graph of Communication)
% graph of communication become a Simplified Cycle Graph with one Sense (Each Robot can...
...take one information from the preceded one, and give on information to the robot that exists after it.

% Plot the Graph of Communication of the System with directed edges (Links with...
...arrows to show the flow of information) (to show which robot communicates with another robot)
% Plot the Initial Positions (marked by rectangles on graph) and Desired Positions (marked by circles on graph) 

% Noting that the robot trajectories can be plotted using the same program...
...of the previous parts, because we have same initial and final positions as previous
% In addition, the Control Law Equation is changed in the Simulink file.
% Then, we can use the same program to plot robot trajectories according...
...to our Simplified Graph (Cycle)

%%
clear all
clc

% Initial position of the 5 robots
Init = [ 0,3 ; 0,-3 ; -5,4 ; -5,0 ; -5,-4 ];
Init_x = Init(:,1)';
Init_y = Init(:,2)';

%Plot Robots Desired Positions
x = [35,32,29,26,23];
y = [0,0,0,0,0];

figure(2);
plot(x(1),y(1) , 'o', 'linewidth', 1)
hold on
plot(x(2),y(2) , 'o', 'linewidth', 1)
plot(x(3),y(3) , 'o', 'linewidth', 1)
plot(x(4),y(4) , 'o', 'linewidth', 1)
plot(x(5),y(5) , 'o', 'linewidth', 1)

%Plot Robots Initial Positions
plot(Init_x(1),Init_y(1) , 's', 'linewidth', 2)
plot(Init_x(2),Init_y(2) , 's', 'linewidth', 2)
plot(Init_x(3),Init_y(3) , 's', 'linewidth', 2)
plot(Init_x(4),Init_y(4) , 's', 'linewidth', 2)
plot(Init_x(5),Init_y(5) , 's', 'linewidth', 2)

xlabel('X');
ylabel('Y');
title('Initial Positions and Final Destinations of all Robots');
legend('Robot1-des','Robot2-des','Robot3-des','Robot4-des','Robot5-des','Robot1-ini','Robot2-ini','Robot3-ini','Robot4-ini','Robot5-ini', 'Location', 'BestOutside')
axis([-6 36 -6 6])
grid on

%Directed Graph
A =[ 0, 0,0,0,1;
       1,0,0,0,0;
       0,1,0,0,0;
       0,0,1,0,0;
       0,0,0,1,0 ]';
  % This matrix aims to plot the flow of information between robots (Sense of the rows on links)
  
Robots = {'Robot_1' 'Robot_2' 'Robot_3' 'Robot_4' 'Robot_5'};
G = digraph( A , Robots );
figure (1)
plot(G) %(Plot the Links with arrows to show the flow of information in random robot positions)
title('Graph (Simplified) of Communication of the System');

