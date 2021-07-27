%equation:
%----- x^2 + x^4 + 6 = x^3 + x^5 + 7 -----

%------------------bisection method------------------
 
 %define function (set equation above to 0, use bisection to find root)
 syms x 
 f = x^5 - x^4 + x^3 - x^2 + 1;
 %g = x^2 + x^4 + 6;
 %h = x^3 + x^5 + 7;
 %fplot(g,h);
 
 p = 0;
 %guess changes with each iteration
 guess = 1;
 %
 isZero = 0;
 %DEFINE interval [a,b]
 a = -1;
 b = 1;
 
 
 %DEFINE error tolerance
 error = 0.01;
 for count = 0:11
     e = abs(guess - p);
     %check if the solution is found
     if( e <= error)
         break;
     end
     
     mid = ((b - a) / 2) + a ;
     %Find interval midpoint
       
     %f(mid)
     guess = subs(f, x, mid);
     guess = round(guess, 6);
     disp(count);
     disp(guess);
     %reassign interval 
     if(guess < 0)
         a = guess;
     elseif(guess > 0)
        b = guess;
     else
         isZero = 1;
         break;
     end
     
     if (isZero == 1)
         break;
     end

 end
 final = guess;
 disp("final answer");
 disp(final);

 


%------------------secant method------------------
 %pn = pn-1 - f(pn-1)(pn-1 - pn-2)/(f(pn-1) - f(pn-2))
 
 %pn = x intercept of line ab where a =(pn-1, f(pn-1)), b =(pn-2,f(pn-2))
 