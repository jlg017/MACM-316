%---------------------------------Question 1-------------------------------
%a)
n = 15;
%random matrix with values in the interval [-1,1]
B = -1 + (1+1)*rand(n);
disp('Q1a B = ');
disp(B);

%b) display random orthonormal matrix Q with n ≥ 10.
[Q, R] = qr(B);
disp('Q1b Q = ');
disp(Q);

%% 
%c)
n = 50;
%e = epsilon = 10^-8
e = 0.0000001;
eQ = cell(10);

for i = 1:100
    A = -1 + (1+1)*rand(n);
    [Q, R] = qr(A);
    eQ{i} = e * Q;
end

%---------------------------------Question 2-------------------------------
% a)
v = ones(1,n-1);
J = diag(v,1);

% b)
B = 4*J;
kB = cond(B,2);
eigen_b = eig(B);
disp('Q2b eigenvalues of A = 4*J:');
disp(eigen_b);
disp('Q2b kA:');
disp(kB);
for i = 1:100
    eQi = cell2mat(eQ(i));
    bPerturb = eig(B + eQi);
    plot(bPerturb, '.');
    hold on
end
hold off

% c)
C = (4*J + 4*J^2);
kC = cond(C,2);
eigen_c = eig(C);
disp('Q2c eigenvalues of A = 4*J + 4*J^2:');
disp(eigen_c);
disp('Q2c kA:');
disp(kC);
for i = 1:100
    eQi = cell2mat(eQ(i));
    cPerturb = eig(C + eQi);
    plot(cPerturb, '.');
    hold on
end
hold off

%---------------------------------Question 3-------------------------------
% a)
s = ones(1,n);
s = s *(-2);
S = diag(s);
l = ones(1,n-1);
L = diag(l,-1);
%Matrices
L = S + L;
S = L + J;
U = J;

% b) D = A = L^(-1) * U -> code analyzer recommended L\U > inv(L)*U
D = L\U; 
eigen_d = eig(D);
disp('Q3b eigenvalues of A = inv(L)*U:');
disp(eigen_d);
kD = cond(D,2);
disp('Q3b kA:');
disp(kD);
plot(eigen_d, '.');

% c)
for i = 1:100
    eQi = cell2mat(eQ(i));
    dPerturb = eig(D + eQi);
    plot(dPerturb, '.');
    hold on
end
hold off
 
%---------------------------------Question 4-------------------------------
% a)
r = linspace(-2,2,n);
p = poly(r);

% b) F = A = companion matrix to p
F = compan(p);

% c)
eigen_f = eig(F);
disp('Q4c Compare roots r with eigenvalues of A');
disp(abs(r' - eigen_f));
kF = cond(F,2);
disp('Q4c kA:');
disp(kF);

for i = 1:100
    eQi = cell2mat(eQ(i));
    fPerturb = eig(F+ eQi);
    plot(fPerturb, '.');
    hold on
end
hold off

% d)
M = 2*rand(n) - 1; 
[W,R] = qr(M); 
%G = Matrix B as per question
G = W*diag(r)*W';
eigen_g = eig(G);
disp('Q4d eigenvalues of B:');
disp(eigen_g);
gPer_eig = cell(10);
g2Per_eig = cell(10);
%calculate eigenvalues using 10 perturbation matrices
for i = 1:10
    eQi = cell2mat(eQ(i));
    eQiT = eQi';
    gPerturb = eig(G + eQi);
    gPer_eig{i} = gPerturb;
    g2Perturb = eig(G + (eQi + eQiT));
    g2Per_eig{i} = g2Perturb;
    msg = ['Q4d eigenvalues of B + eQ{',num2str(i),'} vs eigenvalues of B + (e(Q{',num2str(i),'} + transpose(Q{',num2str(i),'}))):'];
    disp(msg);
    disp([gPerturb g2Perturb]);
    disp('Q4d difference:');
    disp(abs(eigen_g - gPerturb));
end

%compare eigenvalues of A and B
diff = abs(eigen_f - eigen_g);
disp('Q4d difference between eigenvalues of A vs B');
disp(diff);

