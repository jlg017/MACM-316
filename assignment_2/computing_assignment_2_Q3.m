%------------------Q3: Newton's Method------------------

%equation:
%---------------------- x^2 + x^4 + 6 = x^3 + x^5 + 7 ---------------------
%function f(x) = 0
syms x
f = x^5 - x^4 + x^3 - x^2 + 1;
%f'(x)
f_deriv = 5*x^4 - 4*x^3 + 3*x^2 - 2*x;
%initial approximation
p0 = -1;
%error tolerance
tolerance = 0.00001;

for i = 0:10
   fp = subs(f, x, p0);
   fd_p = subs(f_deriv, x, p0); 
   p = p0 - (fp / fd_p);
   p = round(p,12);
   %to display all 11 iterations comment out lines 21-26
   
   if(abs(p - p0) < tolerance)
       disp(i);
       disp("approximation found");
       disp(p);
       break;
   end
   disp(i);
   disp(p);
   p0 = p;
end
