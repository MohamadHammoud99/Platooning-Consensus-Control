
%% Parameter Definitions and Plot Robot Trajectories
% This section works in all Simulink files of the project having the same...
...initial and desired positions as below
% According to the Control Law equations used in each Simulink file, we take...
...the output (plot) of All Robot Trajectories
% First, we should run this program to define the parameters and the Initial and Desired Positions
% Next, we should run the desired Simulink file (Part 3 & 4), we can see the...
...Outputs of each robot coordinates (x & y) from different scopes in Simulink
% Finally, we should run this program to ma ke the plot of all robot...
...trajectories in one figure, and the subplot of each robot trajectory (alone)

% Also this Program plot the robot trajectories of the Extra_Question...
...Part : run this program ---> run simulink Part_Extra_Question ---> run this program ---> Done.

% Note : the Extra_Question was: "Propose a controller that forms the ...
...platoon, then the robots continue to travel in platooning, parallel to the...
...'y-axis' at constant speed. So the platoon change direction, but the...
...inter-distance between robots should be maintained."

%%
close all;
clc;

%Initial Robot Positions    
r_0 = [ 0 , 0 , -5 , -5 , -5 ;
        3 , -3 , 4 , 0 , -4 ];
    
%Desired Robot Positions (Final Destination)
rd = [ 35 , 32 , 29 , 26 , 23 ;
        0 , 0 , 0 , 0 , 0 ];
 
%Initial Position (Vectors r_0 : [X0 ; Y0])   
r1_0 = r_0(:,1);
r2_0 = r_0(:,2);
r3_0 = r_0(:,3);
r4_0 = r_0(:,4);
r5_0 = r_0(:,5);

%Initial Position (X0)   
x1_0 = r1_0(1);
x2_0 = r2_0(1);
x3_0 = r3_0(1);
x4_0 = r4_0(1);
x5_0 = r5_0(1);

%Initial Position (Y0)   
y1_0 = r1_0(2);
y2_0 = r2_0(2);
y3_0 = r3_0(2);
y4_0 = r4_0(2);
y5_0 = r5_0(2);

%Desired Position (Vectors rd : [Xd ; Yd]) 
r1d = rd(:,1);
r2d = rd(:,2);
r3d = rd(:,3);
r4d = rd(:,4);
r5d = rd(:,5);

%Desired Position (Xd) 
x1d = r1d(1);
x2d = r2d(1);
x3d = r3d(1);
x4d = r4d(1);
x5d = r5d(1);

%Desired Position (Yd) 
y1d = r1d(2);
y2d = r2d(2);
y3d = r3d(2);
y4d = r4d(2);
y5d = r5d(2);

% K Gain matrix (for Formation convergence)
K1 = [0, 1, 1, 1, 1 ;
     1, 0, 1, 1, 1 ;
     1, 1, 0, 1, 1 ;
     1, 1, 1, 0, 1 ;
     1, 1, 1, 1, 0 ;];

 K = 10 * K1;
 
K11 = 0 ; K22 = 0 ; K33 = 0 ; K44 = 0 ; K55 = 0 ;

K12 = K(1,2); K13 = K(1,3); K14 = K(1,4); K15 = K(1,5);

K21 = K(2,1); K23 = K(2,1); K24 = K(2,1); K25 = K(2,1);

K31 = K(3,1); K32 = K(3,2); K34 = K(3,4); K35 = K(3,5);

K41 = K(4,1); K42 = K(4,2); K43 = K(4,3); K45 = K(4,5);

K51 = K(5,1); K52 = K(5,2); K53 = K(5,3); K54 = K(5,4);

% g : Depending on Communications, Here all the robots communicate between...
...themselves, just gii = 0, no communication between each robot and itself
g = [ 0 , 1 , 1 , 1 , 1 ;
      1 , 0 , 1 , 1 , 1 ;
      1 , 1 , 0 , 1 , 1 ;
      1 , 1 , 1 , 0 , 1 ;
      1 , 1 , 1 , 1 , 0 ;];
 %Noting that we didn't use this matrix in the equation in Simulink,we simplify...
 ...the equations directly, but here just we show it to give the possiblity...
 ...of changing it after developing of the method.

 %Same thing for the Part 4 in this project, when the graph of communication...
 ...become a Simplified Cycle Graph with one Sense (Each Robot can take one ...
 ...information from the preceded one, and give on information to the robot that exists after it.
  

% Alpha : Gain (for Position convergence (of each robot to it desired position - Final Destination))
Alpha = 1 ;

% L : positive number (distance alignment)
L = 1 ;

figure(1)

% Plot All Robot Trajectories in one Figure Alone
plot(xh1,yh1,xh2,yh2,xh3,yh3,xh4,yh4,xh5,yh5, 'linewidth', 1)
grid on
axis([-6 36 -6 11]);
xlabel('X','FontWeight','bold');
ylabel('Y','FontWeight','bold');
legend('Robot1','Robot2','Robot3','Robot4','Robot5', 'Location', 'BestOutside');
title('All Robot Trajectories')

% Plot different subplots
figure(2)

subplot(2,3,1)
% Plot all robot trajectories in one subplot
plot(xh1,yh1,xh2,yh2,xh3,yh3,xh4,yh4,xh5,yh5, 'linewidth', 1)
axis([-6 36 -6 11]);
title('All Robots')
xlabel('X','FontWeight','bold');
ylabel('Y','FontWeight','bold');
legend('Robot1','Robot2','Robot3','Robot4','Robot5', 'Location', 'BestOutside')
grid on

subplot(2,3,2)
% Plot the trajectory of Robot 1 alone, from its initial position to its final destination
plot(xh1,yh1, 'b', 'linewidth', 2)
axis([-6 36 -6 11]);
title('Robot 1')
xlabel('X','FontWeight','bold');
ylabel('Y','FontWeight','bold');
grid on

subplot(2,3,3)
% Plot the trajectory of Robot 2 alone, from its initial position to its final destination
plot(xh2,yh2, 'r', 'linewidth', 2)
axis([-6 36 -6 11]);
title('Robot 2')
xlabel('X','FontWeight','bold');
ylabel('Y','FontWeight','bold');
grid on

subplot(2,3,4)
% Plot the trajectory of Robot 3 alone, from its initial position to its final destination
plot(xh3,yh3, 'k', 'linewidth', 2)
axis([-6 36 -6 11]);
title('Robot 3')
xlabel('X','FontWeight','bold');
ylabel('Y','FontWeight','bold');
grid on

subplot(2,3,5)
% Plot the trajectory of Robot 4 alone, from its initial position to its final destination
plot(xh4,yh4, 'm', 'linewidth', 2)
axis([-6 36 -6 11]);
title('Robot 4')
xlabel('X','FontWeight','bold');
ylabel('Y','FontWeight','bold');
grid on

subplot(2,3,6)
% Plot the trajectory of Robot 5 alone, from its initial position to its final destination
plot(xh5,yh5, 'linewidth', 2)

axis([-6 36 -6 11]);
title('Robot 5')
xlabel('X','FontWeight','bold');
ylabel('Y','FontWeight','bold');
grid on


% You can Uncomment this part of the script to see the Animation of the
% quadcopter in the XY Plane
figure(3)
curve = animatedline('linewidth',1)
title('Animation in XY Plane');

for i=1:length(t)
   addpoints(curve, xh1(i), yh1(i), t(i));
   drawnow
  grid on

end

