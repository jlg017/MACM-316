%------------------Q4: Secant Method------------------

%equation:
%---------------------- x^2 + x^4 + 6 = x^3 + x^5 + 7 ---------------------
%function f(x) = 0
syms x
f = x^5 - x^4 + x^3 - x^2 + 1;

%initial approximation
p0 = 0;
p1 = -1;
%f(p0) and f(p1)
fp0 = subs(f,x,p0);
fp1 = subs(f,x,p1);
%error tolerance
tolerance = 0.00001;

 for i = 2:15
    p = p1 - ((fp1 * (p1 - p0)) / (fp1 - fp0));
    p = round(p,12);
    e = p - p1;
    disp(i);
    if(abs(e) < tolerance)
        disp("approximation found");
        disp(p);
        break;
   end
    %display first 11 iterations
    if(i < 11)
        disp(p);
    end
    %reassign for next iteration
    p0 = p1;
    p1 = p;
    fp0 = fp1;
    fp1 = subs(f,x,p);
 end
 if(i == 20)
     disp("approx not found");
 end