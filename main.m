close all;
clear all;
global f_glob wzorzec_glob L3_R C2_R
% poczatkowe wartosci elementow
R1 = 14;
R2 = 70;
R3 = 5;
R4 = 75; % rezonans

L1 = 1; %mH
L2 = 1.1; %mH
L3 = 10; %mH % rezonans
L3_R = 0.2; 

C1 = 2; %uF
C2 = 200; %uF % rezonans
C2_R = 0.5;
components = [R1, R2, R3, L1, L2, C1, R4, L3, C2];
% components =
% [15.0445923278709,90.3427533567526,9.99604791069099,0.728006754645289,0.935816075321060,0.00897523955776602];
f = [20, 40, 70, 100, 200, 300, 400, 500, 700, 1000, 2000, 3000, 4000, 5000, 6000, 8000, 10000, 20000];
f_glob = f;
wzorzec = [14.5, 15, 15.5, 15.75, 16, 16, 16.75, 17, 18.5, 20, 26, 31, 35, 39, 42.5, 50, 57, 85];
wzorzec_glob = wzorzec;
dupa =  Z_model(components,f);

 c_lb = [0 0 0 0 0 0 0 0 0];
 c_ub = [1000 1000 1000 1000 1000 1000 1000 1000 1000];

 opts=optimset('Display', 'iter ' , 'MaxIter' , 2000);
tic
[x_opt,fval] = fminimax (@work_fun_minimax , components , [] , [] , [] , [] ,c_lb , c_ub, [], opts);
toc
fval_max = max(fval);
opts = optimoptions(@fmincon,'Display', 'iter ' , 'MaxFunEvals' , 10000, 'MaxIter',10000);
tic
problem = createOptimProblem('fmincon','x0',components,'objective',@work_fun,'lb',c_lb,'ub',c_ub,'options',opts);
[x_opt_global,fval_global] = run(GlobalSearch,problem);
toc
dupa2 = work_fun(x_opt);
fig = figure(1);
semilogx(f, wzorzec, 'blue','LineWidth',2);
hold on;
%semilogx(f, Z_model(components,f), 'red''LineWidth',5);
semilogx(f, Z_model(x_opt,f), 'red','LineWidth',2);
semilogx(f, Z_model(x_opt_global,f), 'green','LineWidth',2);
 datacursormode(fig,'on');

%dupa3 = abs(Z_model(x_opt,f) - wzorzec);
%dupa3_temp = [0.582997079834279,0.0935561275410670,0.377492795316931,0.582997256945948,0.577147079806906,0.171667505685409,0.393324800071333,0.0222634095081560,0.116379892495974,0.582996957059336,0.479396493300875,0.266964946224036,0.418005659478339,0.578012515352825,0.191393892624355,0.0615067826831179,0.471484325187660,0.582399788110564];
%fig2 = figure(2);
%semilogx(f,dupa3,'red');
%hold on;
%semilogx(f,dupa3_temp,'blue');
%datacursormode(fig2,'on');
