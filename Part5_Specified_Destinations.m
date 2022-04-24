
%% Part 5 : New Desired Destinations (Different Positionning Order)
% Here the destinations have been changed.
% T his section works in the Simulink file of the project having the same...
...initial and desired positions as below (here we have new destinations)
% First, run this program to define the parameters and the new Final Destinations.
% Then, run the desired Simulink file, and we can see the Outputs of each...
...robot coordinates (x & y) from different scopes in Simulink
% Finally, we should run this program to make the plot of all robot...
...trajectories in one figure, and the subplot of each robot trajectory (alone)

% This section works with Part_3 and Part_4 Simulink files.
% Noting that the conditions in Part_Extra_Question is on the x components in...
...Parameters_and_Plot .m file and not in this "Changed Destinaitons"
% If we want to run this program on the simulink of Extra_Question, we...
...should change the conditions in the Matlab Function in Simulink (Part_Extra_Question)

%%
close all;
clc;

%Initial Position    
r_0 = [ 0 , 0 , -5 , -5 , -5 ;
        3 , -3 , 4 , 0 , -4 ];
    
%Desired Position (Changed in this Part)
rd = [ 23 , 29 , 32 , 35 , 26 ;
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
 
 K = K1 * 1


K11 = 0 ; K22 = 0 ; K33 = 0 ; K44 = 0 ; K55 = 0 ;

K12 = K(1,2); K13 = K(1,3); K14 = K(1,4); K15 = K(1,5);

K21 = K(2,1); K23 = K(2,1); K24 = K(2,1); K25 = K(2,1);

K31 = K(3,1); K32 = K(3,2); K34 = K(3,4); K35 = K(3,5);

K41 = K(4,1); K42 = K(4,2); K43 = K(4,3); K45 = K(4,5);

K51 = K(5,1); K52 = K(5,2); K53 = K(5,3); K54 = K(5,4);

% g : Depending on Communications, Here all the robots communicate between
% themselves, just gii = 0, no communication between each robot and itself
g = [ 0 , 1 , 1 , 1 , 1 ;
      1 , 0 , 1 , 1 , 1 ;
      1 , 1 , 0 , 1 , 1 ;
      1 , 1 , 1 , 0 , 1 ;
      1 , 1 , 1 , 1 , 0 ;];
 %Noting that we didn't use this matrix in the equation in Simulink,we simplify...
 ...the equations directly, but here just we show it to give the possiblity...
 ...of changing it after in developping of the method.
  
% Alpha : Gain (for Position convergence)
Alpha = 1 ;

% L : positive number (distance alignment)
L = 1 ;

figure(1)

% Plot All Robot Trajectories in one Figure Alone
plot(xh1,yh1,xh2,yh2,xh3,yh3,xh4,yh4,xh5,yh5, 'linewidth', 1)
grid on
axis([-6 36 -6 6]);
xlabel('X','FontWeight','bold');
ylabel('Y','FontWeight','bold');
legend('Robot1','Robot2','Robot3','Robot4','Robot5', 'Location', 'BestOutside');
title('Robots Trajectories')

% Plot different subplots
figure(2)

subplot(2,3,1)
% Plot all robot trajectories in one subplot
plot(xh1,yh1,xh2,yh2,xh3,yh3,xh4,yh4,xh5,yh5, 'linewidth', 1)
title('All Robots')
xlabel('X','FontWeight','bold');
ylabel('Y','FontWeight','bold');
legend('Robot1','Robot2','Robot3','Robot4','Robot5', 'Location', 'BestOutside')
grid on

subplot(2,3,2)
% Plot the trajectory of Robot 1 alone, from its initial position to its final destination
plot(xh1,yh1, 'b', 'linewidth', 2)
axis([-6 36 -6 6]);
title('Robot 1')
xlabel('X','FontWeight','bold');
ylabel('Y','FontWeight','bold');
grid on

subplot(2,3,3)
% Plot the trajectory of Robot 2 alone, from its initial position to its final destination
plot(xh2,yh2, 'r', 'linewidth', 2)
title('Robot 2')
xlabel('X','FontWeight','bold');
ylabel('Y','FontWeight','bold');
grid on

subplot(2,3,4)
% Plot the trajectory of Robot 3 alone, from its initial position to its final destination
plot(xh3,yh3, 'k', 'linewidth', 2)
title('Robot 3')
xlabel('X','FontWeight','bold');
ylabel('Y','FontWeight','bold');
grid on

subplot(2,3,5)
% Plot the trajectory of Robot 4 alone, from its initial position to its final destination
plot(xh4,yh4, 'm', 'linewidth', 2)
title('Robot 4')
xlabel('X','FontWeight','bold');
ylabel('Y','FontWeight','bold');
grid on

subplot(2,3,6)
% Plot the trajectory of Robot 5 alone, from its initial position to its final destination
plot(xh5,yh5, 'linewidth', 2)
title('Robot 5')
xlabel('X','FontWeight','bold');
ylabel('Y','FontWeight','bold');
grid on

% Plot Initial Robot Positions and Final Destinations (Changed in this problem part)
figure(3)
% Initial position of the 5 robots:
Init = [ 0,3 ; 0,-3 ; -5,4 ; -5,0 ; -5,-4 ];
Init_x = Init(:,1)';
Init_y = Init(:,2)';

%Plot Robots Desired Positions
x = [23,29,32,35,26];
y = [0,0,0,0,0];

plot(x(1),y(1) , 'o' , 'linewidth', 1)
hold on
plot(x(2),y(2) , 'o' , 'linewidth', 1)
plot(x(3),y(3) , 'o' , 'linewidth', 1)
plot(x(4),y(4) , 'o' , 'linewidth', 1)
plot(x(5),y(5) , 'o' , 'linewidth', 1)

%Plot Robots Initial Positions
plot(Init_x(1),Init_y(1) , 's' , 'linewidth', 2)
plot(Init_x(2),Init_y(2) , 's' , 'linewidth', 2)
plot(Init_x(3),Init_y(3) , 's' , 'linewidth', 2)
plot(Init_x(4),Init_y(4) , 's' , 'linewidth', 2)
plot(Init_x(5),Init_y(5) , 's' , 'linewidth', 2)

xlabel('X');
ylabel('Y');
title('Initial Positions and (New) Final Destinations of all Robots');
legend('Robot1-des','Robot2-des','Robot3-des','Robot4-des','Robot5-des','Robot1-ini','Robot2-ini','Robot3-ini','Robot4-ini','Robot5-ini', 'Location', 'BestOutside')
axis([-6 36 -6 6])
grid on
