%Computational Methods in Mechanics
%Homework set 3, exercise 4.14
%Daphne van Dijken

clear all
close all
clc

%u' = v
%v' = -w^2*u

omega = 2;
P = 2*pi/omega;
dt = P/2000;
T = 3*P;
N_t = floor(T/dt);
t = linspace(0, N_t*dt, N_t+1);
u = zeros(N_t+1, 1);
v = zeros(N_t+1, 1);

% Initial condition
X_0 = 2;
u(end) = X_0;
v(end) = 0;

for n = (N_t+1):-1:2
u(n-1) = u(n) - dt*v(n);
v(n-1) = v(n) + dt*omega^2*u(n);
end
plot(t, u, 'b-', t, X_0*cos(omega*t), 'r--');
legend('numerical', 'exact', 'Location','northwest');
xlabel('t');
