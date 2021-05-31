clc
clear all
%Задание времени перемещения
T=10;
%Задание количества участков разбиения
N=5;
t=0:T/N:T;
%Определение декартовых координат и ориентации рабочего органа механизма в
%каждой точке траектории

x=[0 25 21 -28.7 -10 0];
y=[0 25 21 -28.7 -10 0];
z=[-228.24 -239.5 -280 -270 -229 -228.24];

%z=[-228.24 -239.5 -270 -300 -259 -228.24];
% return
% x(0)=0;
% y(0)=0;
% z(0)=-228.5;
% 
% x(1)=25;
% y(1)=25;
% z(1)=-239.5;
% 
% x(2)=21;
% y(2)=21;
% z(2)=-280;
% 
% x(3)=-28.7;
% y(3)=-28.7;
% z(3)=-270;
% 
% x(4)=-10;
% y(4)=-10;
% z(4)=-229;
% 
% x(5)=0;
% y(5)=0;
% z(5)=-228.5;
 
% x=40*cos(pi*t/15)*cos(pi/4)-35;
% y=40*cos(pi*t/15)*sin(pi/4)+45;
% % [x, y] = meshgrid(x,y);
% z=30*sin(pi*t/15)-250;

m=plot3(x,y,z,'-')
hold on
plot3(x,y,z,'*')
xlabel('X')
ylabel('Y')
zlabel('Z')
grid on
%Решение обратной задачи о положениях в каждой точке траектории
for i=1:N+1
    Q(:,i)=OZK(x(i),y(i),z(i))
end

%Задаём начальные условия для численного решения
%Для каждой обобщённой координаты ищем коэффициенты многочлена
for j=1:3
    v=Q(j,:);
    p(j,:)=Koefficienti(v,T,N);
    s(j,:)=Odin_mnogohlen(v,T,N);
end

%Построения графика изменения первой обобщённой координаты
for i=1:3
    j=1; %номер участка разбиения
    for t=0:T/N:T-T/N
        t1=t:0.1:t+T/N-0.1;
        %Задаём зависимость обобщённой координаты от времени
        switch j
            case 1
                q(i,1+(j-1)*size(t1,2):j*size(t1,2))=polyval(fliplr(p(i,1:5)),t1)
            case N
                q(i,1+(j-1)*size(t1,2):j*size(t1,2))=polyval(fliplr(p(i,4*N-2:4*N+2)),t1)
            otherwise
                q(i,1+(j-1)*size(t1,2):j*size(t1,2))=polyval(fliplr(p(i,6+4*(j-2):9+4*(j-2))),t1)
        end
        j=j+1;
    end
    t=0:0.1:T-0.1
    s1=fliplr(s(i,:));
    y=polyval(s1,t);
    %Строим графики зависимость скорости изменения обобщённой
    %координатs от времени
    figure
    switch i
        case 1
            plot(t,q(i,:),'c');
            hold on
            plot(t,y,'m');
            hold on
            plot(0:T/N:T,Q(i,:),'r*')
            grid on
            title('Q1')
        case 2
            plot(t,q(i,:),'c');
            hold on
            plot(t,y,'m');
            hold on
            plot(0:T/N:T,Q(i,:),'r*')
            grid on
            title('Q2')
        case 3
            plot(t,q(i,:),'c');
            hold on
            plot(t,y,'m');
            hold on
            plot(0:T/N:T,Q(i,:),'r*')
            grid on
            title('Q3')
    end
    xlabel('t,сек')
    ylabel('Q')
end

%%
t11=[0:0.1:T-0.1]'; 
Q1=q(1,:)';
Q2=q(2,:)';
Q3=q(3,:)';
signal_T1=[t11,Q1]
signal_T2=[t11,Q2]
signal_T3=[t11,Q3]