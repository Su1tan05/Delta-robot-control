function [theta] = IKinemTh(x0, y0, z0,L)
    R = L.Base_Length; % радиус окружности основания дельта-робота
    r = L.EndEffector_Length; % радиус окружности выходного звена дельта-робота
    l=L.FirstLinc ; % длина первого сочленения
    L1 = L.SecondLinc;% длина второго сочленения
    
    y1 = -R;
    y0 = y0-r; % shift center to edg    
    a = (x0.^2 + y0.^2 + z0.^2 + L1.^2 - l.^2 - y1.^2)./(2.*z0);
    b = (y1-y0)./z0;
    % discriminant
    D = -(a + b.*y1).^2 + L1.^2.*(b.^2+1);
    if D < 0 
        theta = nan; % non-existing     
    else  
        yj = (y1 - a.*b - sqrt(D)) ./ (b.^2 + 1); 
        zj = a + b.*yj;
        theta = atan(-zj./(y1-yj));
        if (yj>y1)
            theta = theta + pi;
        end
        theta = rad2deg(theta);
    end    
end