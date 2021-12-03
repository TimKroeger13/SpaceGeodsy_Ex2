%% kepler_ecc_ano
% Discription:
% Calcualtes eccentric anomaly E from kepler II law E = M + e*sin(E) 
% with an iterative approch, where E0 = M. Stops at a presecion from 10^−6
% usage:
% [E,it] = kepler_ecc_ano(M,e)
% Where M = meananomaly and e = eccentricity.
% input:
% M <= Mean anomaly in [rad]
% E <= eccentricity [0>= e =<1]
% output:
% [E] <= Eccentric anomaly
% external calls:
% none

%% Function

function [E,it] = kepler_ecc_ano(M,e)

% Value checks:

if (~isnumeric(M))
    error("M must be numeric.")
end
if (~isnumeric(e))
    error("e must be numeric.")
end
if (e<0 || e>1)
    error("e must be '0>= e =<1'.")
end

% computations

%stating conditions
E_Iterat = M;
Iterations = 0;
deviation = inf;

while (deviation > (10^-6))

    E_recursiv = M + e*sin(E_Iterat);
    deviation = abs(E_recursiv-E_Iterat);

    % Change values recursivly and count the Iterations
    E_Iterat = E_recursiv;
    Iterations = Iterations + 1;

end

E = E_Iterat;
it = Iterations;

end







