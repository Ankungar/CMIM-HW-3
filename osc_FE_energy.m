%Computational Methods in Mechanics
%Homework set 3, exercise 4.10
%Daphne van Dijken

clear all
close all
clc

omega = 2;
P = 2*pi/omega;
dt = P/20;
T = 3*P;
N_t = floor(T/dt);
t = linspace(0, N_t*dt, N_t+1);

u = zeros(N_t+1, 1);
v = zeros(N_t+1, 1);

% Initial condition
X_0 = 2;
u(1) = X_0;
v(1) = 0;
[kin_en(1) pot_en(1)] = osc_energy(u(1),v(1),omega);


% Step equations forward in time
for n = 1:N_t
    u(n+1) = u(n) + dt*v(n);
    v(n+1) = v(n) - dt*omega^2*u(n);
    [kin_en(n+1) pot_en(n+1)] = osc_energy(u(n+1),v(n+1),omega);
end

figure
plot(t, u, 'b-', t, X_0*cos(omega*t), 'r--');
legend('numerical', 'exact', 'Location','northwest');
xlabel('t');

figure
energy = kin_en + pot_en;
plot(t,energy)
xlabel('t')
ylabel('Energy (kinetic + potential)')

print('tmp', '-dpdf');  print('tmp', '-dpng');
