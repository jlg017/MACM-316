%SEIR equation Question 1 (adapted from SIR.m)

%variables
N = 5*10^6;

t = 180; 
alpha = 1/5;
gamma = 1/10;
%r0 = 2.5 -> for Q1
beta = r0 * gamma;

%preallocate compartments
S = zeros(t,1);
E = zeros(t,1);
I = zeros(t,1);
R = zeros(t,1);
New = zeros(t,1);

%initial conditions
R(1) = 0;
I(1) = 40;
E(1) = 20 * I(1);
S(1) = N - I(1) - E(1) - R(1);
%c number of new cases
New(1) = E(1);

for i = 2:t
    S(i) = S(i-1) - beta * I(i-1) * S(i-1) / N;
    E(i) = E(i-1) + beta * I(i-1) * S(i-1) / N - alpha * I(i-1);
    I(i) = I(i-1) + alpha * E(i-1) -  gamma * I(i-1);
    R(i) = R(i-1) + gamma * I(i-1);
    %c number of new cases
    New(i) = New(i-1) + alpha * E(i-1);
end

plot(1:t,S,'LineWidth',2)
hold on
plot(1:t,E,'LineWidth',2)
hold on
plot(1:t,I,'LineWidth',2)
hold on
plot(1:t,R,'LineWidth',2)
hold on
plot(1:t,New,'LineWidth',2)
grid on

%legend("Susceptible","Exposed","Infected","Removed","New Cases")
legend("New Cases")
xlabel("Time")
ylabel("Population")