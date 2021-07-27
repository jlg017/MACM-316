%------------------Q2: Fixed Point Iteration------------------

%equation:
%---------------------- x^2 + x^4 + 6 = x^3 + x^5 + 7 ---------------------
%function f(x) = 0  = g(x) = x 
syms x

g = x - ((x^5 - x^4 + x^3 - x^2 + 1) / (5*x^4 - 4*x^3 + 3*x^2 - 2*x));
tolerance = 0.00001;
p0 = -1;

for i = 0:10
    p = subs(g, x, p0);
    p = round(p, 12);
    disp(i);
    disp(p);
    %to display all 11 iterations comment out lines 18-21
    if (abs(p - p0) < tolerance)
        disp("fixed point found");
        break;
    end
    p0 = p;
end
