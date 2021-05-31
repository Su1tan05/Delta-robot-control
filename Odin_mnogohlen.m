function S=Odin_mnogohlen(v,T,N)
    %Задаём время
    syms t
    %Составление многочлена, определяющего закон изменения обобщённых координат
    for i=1:N+5
        q(i)=t^(i-1);
    end
    P(1,:)=subs(diff(q,t),t,0);
    P(2,:)=subs(diff(q,t),t,T);
    P(3,:)=subs(diff(diff(q,t)),t,0);
    P(4,:)=subs(diff(diff(q,t)),t,T);
    i=5;
    for t1=0:T/N:T
        P(i,:)=subs(q,t,t1);
        A(i,1)=v(i-4);
        i=i+1;
    end
    S=double(inv(P)*A);
end