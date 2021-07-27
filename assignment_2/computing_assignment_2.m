%equation:
%---------------------- x^2 + x^4 + 6 = x^3 + x^5 + 7 ---------------------

%------------------Q1: bisection method------------------
 
%-------Variables------- 
%function
syms x
f = x^5 - x^4 + x^3 - x^2 + 1;
%pi = calculated estimation
pi = 1;
%p = value being estimated
p = 0;
%interval [a,b]
a = -1;
b = 0;
%error tolerance
tolerance = 0.00001;
%--------------------------------------arrays to store calculated values
Index = zeros(1,20);
Bisection = zeros(1,20);

for count = 0:20
    error = abs(pi - p);
    %check if the solution is found to be within the set tolerance
    if( error <= tolerance)
        break;
    end
    %Find interval midpoint
    mid = ((b - a) / 2) + a ;   
    %f(mid)
    pi = subs(f, x, mid);
    pi = round(pi, 12);
    %if(count < 11)
    Index(count) = count;
    Bisection(count) = mid;
        %disp(count);
        %disp(mid);
        %disp(pi);
    %end
    %redefine interval to bisect previous interval  
    
    if(pi < 0)
        a = mid;
    elseif(pi > 0)
       b = mid;
    end   
end
final = mid;
disp("final answer:");
%disp(count);
disp(final);

%------------------Q2: Fixed Point Iteration------------------

p = 0;
for i = 1:30
    
    disp(i);
    fp = subs(f, x, p);
    fp = round(fp, 4);
    disp(p);
    disp(fp);
    
    if (abs(p - fp) < 0.001)
        disp("fixed point found");
        break;
    end
    p = fp;
    
end



%------------------secant method------------------
 %pn = pn-1 - f(pn-1)(pn-1 - pn-2)/(f(pn-1) - f(pn-2))
 
 %pn = x intercept of line ab where a =(pn-1, f(pn-1)), b =(pn-2,f(pn-2))
 