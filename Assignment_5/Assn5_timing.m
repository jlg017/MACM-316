% a) Solve interpolation problem with Vandermonde matrix Va = f
z = 30;
n = 5000;
% v = vector of x values, y = f(x) vector
v = linspace(-1,1,n);
y = 1./(1 + (z*v.^2));

y = y';
V = vander(v);
a = V\y;
%Vandermonde solved polynomial
p = poly2sym(a);