%% Окружность
T=30;
%Задание количества участков разбиения
N=50;
t=0:T/N:T;
x=40*cos(pi*t/15)*cos(pi/4)-25;
y=40*cos(pi*t/15)*sin(pi/4)+35;
z=40*sin(pi*t/15)-130;
m=plot3(x,y,z,'-')
grid on 

%% спираль 

z = 4*pi/10*t-140;
x = 45*cos(pi/6*t)
y = 45*sin(pi/6*t)
m=plot3(x,y,z,'-')
grid on 

%% спираль 