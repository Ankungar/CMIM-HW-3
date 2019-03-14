clear all
close all
clc

f = @(u, t) 1/(1+exp(-u));
U_0 = 0;  

dt = 1;  T = 20;
[u, t] = ode_FE(f, U_0, dt, T);
hold on
plot(t, u, 'r-');
xlabel('t');  ylabel('N(t)');
% Note: this print statement gets a problem with the decimal point
%print(filestem,'-dpng');  print(filestem,'-dpdf');  
% so we rather do it like this:

dt = 0.02;  T = 20;
[u, t] = ode_FE(f, U_0, dt, T);
plot(t, u, 'b-');
xlabel('t');  ylabel('N(t)');
