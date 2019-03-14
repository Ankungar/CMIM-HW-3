%Computational Methods in Mechanics
%Homework set 3, exercise 4.10
%Daphne van Dijken
function [kin_en pot_en] = osc_energy(u,v,omega)
    kin_en = 0.5*v^2;
    pot_en = 0.5*omega^2*u^2;
end