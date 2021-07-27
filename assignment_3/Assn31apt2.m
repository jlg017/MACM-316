%extract data from file
data = load('Data.mat');
A = data.H;
B = data.B;
D = data.D;
epsilon = data.epsilon;
%Second Matrix
k1 = cond(A,1); 
x = [];
y = [];
%Amplification Factors and index i
Amp = [];
i = 0;

for j = 1:10
    b = B(:,j); 
    x = A\b;
    for k = 1:10
        i=i+1;
        d = D(:,k);
        y = A\(b + epsilon*d);
        Amp(i) = norm(y-x,1) / (epsilon*norm(x,1));
    end 
end
%disp(k1)
%disp(Amp)
y1 = yline(k1, '-','kappa_{1}(H)', 'LineWidth', 2);
y1.LabelHorizontalAlignment = 'center';
y1.Color = 'black';
hold on
i = [1:1:100];
scatter(i,Amp)
set(gca, 'YScale', 'log')
axis([1 100 0 10^9])
hold off

