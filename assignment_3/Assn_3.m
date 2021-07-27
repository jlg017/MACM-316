%% 
%--------------------------------Question 1a--------------------------------
%First Matrix

%extract data from file
data = load('Data.mat');
A = data.E;
B = data.B;
D = data.D;
epsilon = data.epsilon;

%calculate amplification upper bound
k1 = cond(A,1); 
x = [];
y = [];

%Amplification Factors and index i
Amp = [];
i = 0;
%Calculate
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

%Display Values
disp('Average of Amplication Factors for E:');
disp(mean(Amp));
disp('Median of Amplication Factors for E:');
disp(median(Amp));
disp('Max of Amplication Factors for E:');
disp(max(Amp));
disp('kappa_{1}(E)');
disp(k1);

%plot
y1 = yline(k1, '-','kappa_{1}(E)', 'LineWidth', 2);
y1.LabelHorizontalAlignment = 'center';
y1.Color = 'black';
hold on
num = [1:1:100];
scatter(num,Amp)
set(gca, 'YScale', 'log')
xlabel('Calculation Number')
ylabel('Amplification Factor')
axis([1 100 0 10^4])
hold off

%%
%Second Matrix

%extract data from file
data = load('Data.mat');
A = data.H;
B = data.B;
D = data.D;
epsilon = data.epsilon;

%calculate amplification upper bound
k1 = cond(A,1); 
x = [];
y = [];

%Amplification Factors and index i
Amp = [];
i = 0;
%Calculate
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

%Display Values
disp('Average of Amplication Factors for H:');
disp(mean(Amp));
disp('Median of Amplication Factors for H:');
disp(median(Amp));
disp('Max of Amplication Factors for H:');
disp(max(Amp));
disp('kappa_{1}(H)');
disp(k1);

%plot
y1 = yline(k1, '-','kappa_{1}(H)', 'LineWidth', 2);
y1.LabelHorizontalAlignment = 'center';
y1.Color = 'black';
hold on
num = [1:1:100];
scatter(num,Amp)
set(gca, 'YScale', 'log')
axis([1 100 0 10^9])
xlabel('Calculation Number')
ylabel('Amplification Factor') 
hold off

%%
%--------------------------------Question 1b-------------------------------
%Matrix 1
%extract data from file
data = load('Data.mat');
A = data.E;
B = data.B;
BIGC = data.BIGC;
epsilon = data.epsilon;

%calculate amplification upper bound & the reciprocal of its reciprocal
k1 = cond(A,1);
k1_r = 1/rcond(A);
x = [];
y = [];

%Amplification Factors and index i
Amp = [];
i = 0;
%Calculate
for j = 1:10
    b = B(:,j); 
    x = A\b;
    for n = 1:6
        C = BIGC(:,:,n);
        i = i+1;
        z = (A + epsilon*C)\b;
        Amp(i) = norm(z-x,1) / (epsilon*norm(x,1));
    end
     
end

%Display Values
disp('Average of Amplication Factors for E (Perturbed):');
disp(mean(Amp));
disp('Median of Amplication Factors for E (Perturbed):');
disp(median(Amp));
disp('Max of Amplication Factors for E (Perturbed):')
disp(max(Amp));
disp('kappa_{1}(perturbed E)');
disp(k1);
disp('1/kappa_{1}(perturbed E)^-1');
disp(k1_r);
%plot
y1 = yline(k1, '-','kappa_{1}(E)', 'LineWidth', 2);
y1.LabelHorizontalAlignment = 'center';
y1.Color = 'black';
y2 = yline(k1_r, '-','1/kappa_{1}^-1(E)', 'LineWidth', 2);
y1.LabelHorizontalAlignment = 'center';
y1.Color = 'black';

hold on
num = [1:60];
scatter(num,Amp)
set(gca, 'YScale', 'log')
axis([1 60 10^-4 10^5])
title('E Perturbed')
xlabel('Calculation Number')
ylabel('Amplification Factor') 
hold off

%%
%--------------------------------Question 1b-------------------------------
%Matrix 2
%extract data from file
data = load('Data.mat');
A = data.H;
B = data.B;
BIGC = data.BIGC;
epsilon = data.epsilon;

%calculate amplification upper bound & the reciprocal of its reciprocal
k1 = cond(A,1);
k1_r = 1/rcond(A);
x = [];
y = [];

%Amplification Factors and index i
Amp = [];
i = 0;
%Calculate
for j = 1:10
    b = B(:,j); 
    x = A\b;
    for n = 1:6
        C = BIGC(:,:,n);
        i=i+1;
        z = (A + epsilon*C)\b;
        Amp(i) = norm(z-x,1) / (epsilon*norm(x,1));
    end
end

%Display Values
disp('Average of Amplication Factors for H(Perturbed):')
disp(mean(Amp))
disp('Median of Amplication Factors for H(Perturbed):')
disp(median(Amp))
disp('Max of Amplication Factors for H(Perturbed):')
disp(max(Amp))
disp('kappa_{1}(perturbed H)')
disp(k1)
disp('1/kappa_{1}(perturbed H)^-1')
disp(k1_r)

%plot
y1 = yline(k1, '-','kappa_{1}(H)', 'LineWidth', 2);
y1.LabelHorizontalAlignment = 'center';
y1.Color = 'black';
y2 = yline(k1_r, '-','1/kappa_{1}(H)^-1', 'LineWidth', 2);
y1.LabelHorizontalAlignment = 'center';
y1.Color = 'black';
hold on
num = [1:60];
scatter(num,Amp)
set(gca, 'YScale', 'log')
axis([1 60 10^0 10^8])
title('H Perturbed')
xlabel('Calculation Number')
ylabel('Amplification Factor') 
hold off


%%
%--------------------------------Question 2 a------------------------------
%extract data from file
data = load('Data.mat');
%Set up matrices
A = data.E;
AINV = inv(A);
AC = inv(AINV);
I = eye(6);
%Calculate norms
x = norm((A*AINV)-I);
y = norm(AC - A);
%Results
output = ['For A = E ->    norm((A*AINV)-I):', num2str(x), '    norm(AC - A): ', num2str(y)];
disp(output);


%%
%--------------------------------Question 2 b------------------------------
%extract data from file
data = load('Data.mat');
%Set up matrices
A = data.H;
HI = data.HI;
AINV = inv(A);
AC = inv(AINV);
I = eye(6);
%Calculate norms
x = norm((A*AINV)-I);
y = norm(AC - A);
distToExact = norm(AINV - HI);
%Results
output = ['For A = H ->    norm((A*AINV)-I):', num2str(x), '    norm(AC - A): ', num2str(y), '    norm(AINV - HI):', num2str(distToExact)];
disp(output);

%%
%--------------------------------Question 2 c------------------------------
%extract data from file
data = load('Data.mat');
%Set up matrices
A = data.H8;
HI8 = data.HI8;
AINV = inv(A);
AC = inv(AINV);
I = eye(8);
%Calculate norms
x = norm((A*AINV)-I);
y = norm(AC - A);
distToExact = norm(AINV - HI8);
k1 = cond(A,1);
%Results
output = ['For A = H8->    norm((A*AINV)-I):', num2str(x), '    norm(AC - A): ', num2str(y), '    norm(AINV - HI8):', num2str(distToExact), '     kappa_{1}(A):', num2str(k1)];
disp(output);

