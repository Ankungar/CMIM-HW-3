%Computational Methods in Mechanics
%Homework set 3, exercise 4.4
%Daphne van Dijken

clear all
close all
clc

%Define variables
f = @(u, t) 1/(1+exp(-t));
U_0 = 0;  
T = 100;

%Define initial k, initial dt
k = 0;
dt = 50;

while 1
       
    %Close previous window
    close all
    
    %Calculate the two timesteps
    dtk(k+1) = 2^-(k)*dt;
    dtk(k+2) = 2^-(k+1)*dt;

    %Run the ODE function
    [u1, t1] = ode_FE(f, U_0, dtk(k+1), T);

    [u2, t2] = ode_FE(f, U_0, dtk(k+2), T);

    %Plot the output
    hold on
    plot(t1, u1, 'r-');
    plot(t2, u2, 'b-');
    xlabel('x');  ylabel('Logistic equation');
    legend(sprintf('Timestep %g', dtk(end-1)),sprintf('Timestep %g', dtk(end)));
    hold off
    
    %Ask user if they want to continue
    cont = menu('Would you like to continue?','Yes','No');
    if(cont == 0 | cont == 2)
        break;
    end
    k = k+1;
end

%Print result
fprintf('After %i iterations, you have found a sufficiently small timestep of %f \n',k,dtk(end))