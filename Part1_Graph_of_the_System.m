
%% ARS1 Project - Master 2 University of Technology of COMPIEGNE 
% Project 4 : Platooning - Consensus 
% Consensus-Based Control of 5 Robots (Initial Positions ---> Desired position; with New Formation)

% Done by : Mohamad HAMMOUD, Fadel TARHINI, Ali EL MAZBOUH, Joe BOULOS 
% Supervised by : Dr. Reine Talj-Kfoury
% Date : 22/10/2021

%% Part 1 : Plot the graph of the system (Graph of Communication)
% All the Robots communicate between themselves

% Plot the Graph of Communication of the System with directed edges (Links with...
...arrows to show the flow of information) (to show which robot communicates with another robot)
% Plot the Graph of Communication with Initial Positions (marked by...
...rectangles on graph) and Desired Positions (marked by circles on graph) 

%%
clear all
clc

% Initial position of the 5 robots
Init = [ 0,3 ; 0,-3 ; -5,4 ; -5,0 ; -5,-4 ];
Init_x = Init(:,1)';
Init_y = Init(:,2)';


% Adjacency matrix, All robots communicate between themseves
A =  [ 0, 1,1,1,1;
       1,0,1,1,1;
       1,1,0,1,1;
       1,1,1,0,1;
       1,1,1,1,0 ]; % No communication between each robot and itself
   figure(1)
   
% Connections between robots (here plot of just lines of communication without arrows)
   gplot(A,Init);
   hold on;
   
%Plot Robots Desired Positions (Circle Symbol)
x = [35,32,29,26,23];
y = [0,0,0,0,0];

plot(x(1),y(1) , 'o', 'linewidth', 1)   %Robot 1 desired position
plot(x(2),y(2) , 'o', 'linewidth', 1)   %Robot 2 desired position
plot(x(3),y(3) , 'o', 'linewidth', 1)   %Robot 3 desired position
plot(x(4),y(4) , 'o', 'linewidth', 1)   %Robot 4 desired position
plot(x(5),y(5) , 'o', 'linewidth', 1)   %Robot 5 desired position

%Plot Robots Initial Positions (Rectanle Symbol)
plot(Init_x(1),Init_y(1) , 's', 'linewidth', 2)    %Robot 1 initial position
plot(Init_x(2),Init_y(2) , 's', 'linewidth', 2)    %Robot 2 initial position
plot(Init_x(3),Init_y(3) , 's', 'linewidth', 2)    %Robot 3 initial position
plot(Init_x(4),Init_y(4) , 's', 'linewidth', 2)    %Robot 4 initial position
plot(Init_x(5),Init_y(5) , 's', 'linewidth', 2)    %Robot 5 initial position

xlabel('X');
ylabel('Y');
title('Graph of Communication among the Robots with Initial and Final Positions');
legend('Robots Communications','Robot1-des','Robot2-des','Robot3-des','Robot4-des','Robot5-des','Robot1-ini','Robot2-ini','Robot3-ini','Robot4-ini','Robot5-ini', 'Location', 'BestOutside')
axis([-6 36 -6 6])
grid on

%Directed Graph
% 0 represents no edge between the vertices.
% 1 represents the existence of edge between the vertices. 
A =[ 0, 1,1,1,1;
       1,0,1,1,1;
       1,1,0,1,1;
       1,1,1,0,1;
       1,1,1,1,0 ]; % No communication between each robot and itself
   
Robots = {'Robot_1' 'Robot_2' 'Robot_3' 'Robot_4' 'Robot_5'};
G = digraph( A , Robots );
figure (2)
plot(G)     %(Plot the Links with arrows to show the flow of information in random robot positions)
title('Graph of Communication of the System');

