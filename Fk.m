function XYZ = Fk(theta1, theta2, theta3, L)
    R = L.Base_Length; % радиус окружности основания дельта-робота
    r = L.EndEffector_Length; % радиус окружности выходного звена дельта-робота
    l=L.FirstLinc ; % длина первого сочленения
    L1 = L.SecondLinc;% длина второго сочленения
    
    t = R-r;
    theta1 = deg2rad(theta1);
    theta2 = deg2rad(theta2);
    theta3 = deg2rad(theta3);
    y1 = -(t + L1*cos(theta1));
    z1 = - L1 * sin(theta1);
    
    y2 = (t + L1*cos(theta2)) * sin(pi/6);
    x2 = y2 * tan(pi/3);
    z2 = -L1 * sin(theta2);
    
    y3 = (t + L1*cos(theta3)) * sin(pi/6);
    x3 = -y3 * tan(pi/3);
    z3 = -L1 * sin(theta3);
    
    w1 = y1.^2 + z1.^2;
    w2 = x2.^2 + y2.^2 + z2.^2;
    w3 = x3.^2 + y3.^2 + z3.^2;
    
    dnm = (y2-y1).*x3 - (y3-y1).*x2;
    % x = (a1*z + b1)/dnm
    a1 = (z2-z1).*(y3-y1) - (z3-z1).*(y2-y1);
    b1= -( (w2-w1).*(y3-y1) - (w3-w1).*(y2-y1) ) / 2;
    % y = (a2*z + b2)/dnm
    a2 = -(z2-z1).*x3 + (z3-z1).*x2;
    b2 = ( (w2-w1).*x3 - (w3-w1).*x2) / 2;
    % a*z^2 + b*z + c = 0
    a = a1.^2 + a2.^2 + dnm.^2;
    b = 2 .* (a1.*b1 + a2.*(b2 - y1.*dnm) - z1.*dnm.^2);
    c = (b2 - y1.*dnm).*(b2 - y1.*dnm) + b1.^2 + dnm.^2.*(z1.^2 - l.^2)
    % discriminant
    d = b.*b - 4.*a.*c;
    if d >= 0
        Z = -0.5.*(b + sqrt(d)) / a;
        X = (a1.*Z + b1) / dnm;
        Y = (a2.*Z + b2) / dnm;
        if abs(X) > 300 || abs(Y) > 300 ||  Z > 0 || Z < -500
            fl = -1;% error
        else
            fl = 0;
        end
    else
        X = nan;
        Y = nan;
        Z = nan;
        fl = -1;% non-existing 
    end    
    XYZ(1,1) = X;
    XYZ(2,1) = Y;
    XYZ(3,1) = Z-3.083;
end