%------------------Q1: bisection method------------------
%equation:x^2 + x^4 + 6 = x^3 + x^5 + 7

%function
syms x
f = x^5 - x^4 + x^3 - x^2 + 1;
%pi = calculated estimation, p = value being estimated
pi = 1;
p = 0;
%interval [a,b]
a = -1;
b = 0;
%error tolerance
tolerance = 0.00001;

for i = 0:20
    error = abs(pi - p);
    %check if the solution is found to be within the set tolerance
    if(error <= tolerance)
        disp(i)
        disp("approximation found");
        disp(mid);
        break;
    end
    %Find interval midpoint
    mid = ((b - a) / 2) + a ;   
    %f(mid)
    pi = subs(f, x, mid);
    pi = round(pi, 12);
    if(i < 11)
        disp(i);
        disp(mid);
    end
    %redefine interval to bisect previous interval  
    if(pi < 0)
        a = mid;
    elseif(pi > 0)
       b = mid;
    end   
end