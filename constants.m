% Определение габаритных размеров дельта-робота
function L = constants()
%     L.Base_Length = 88.00125522; % радиус окружности основания дельта-робота
%     L.EndEffector_Length = 49.99032015; % радиус окружности выходного звена дельта-робота
%     L.FirstLinc = 256; % длина первого сочленения
%     L.SecondLinc = 115;% длина второго сочленения
%     L.ModTime = 10; % время моделирования
%     L.NumbOfSplits = 5; % количество точек разбиения траектории
    
    L.Base_Length = 43.36; % радиус окружности основания дельта-робота
    L.EndEffector_Length = 26.51; % радиус окружности выходного звена дельта-робота
    L.FirstLinc = 150; % длина первого сочленения
    L.SecondLinc = 80;% длина второго сочленения
    L.SimTime = 20; % время моделирования
    L.NumberOfSplits = 5; % количество точек разбиения траектории
end

% alpha1 = 0;
% alpha2 = 2*pi/3;
% alpha3 = -2*pi/3;
% % матрицы поворота вокруг оси z
% rotz1=[cos(alpha1) -sin(alpha1) 0;
%         sin(alpha1) cos(alpha1) 0;
%         0 0 1];
% rotz2=[cos(alpha2) -sin(alpha2) 0;
%         sin(alpha2) cos(alpha2) 0;
%         0 0 1];
% rotz3=[cos(alpha3) -sin(alpha3) 0;
%         sin(alpha3) cos(alpha3) 0;
%         0 0 1];