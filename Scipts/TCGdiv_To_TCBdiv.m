%% TCGdiv_To_TCBdiv
% Discription:
% Calculates Barycentric coordinate time difference (TCBdiv) from given 
% Geocentric Coordinate Time difference (TCGdiv).
% usage:
% [TCBdiv] = TCGdiv_To_TCBdiv(TCGdiv)
% input:
% TCGdiv = Geocentric Coordinate Time difference
% output:
% TCBdiv = Barycentric coordinate time difference (TCBdiv)
% external calls:
% none

function [TCBdiv] = TCGdiv_To_TCBdiv(TCGdiv)

%Gravaty potantioal from solar bodys:

SB_names = ["sun","Mercury","Venus","Moon","Mars","Ceres","Jupiter",...
    "Saturn","Uranus","Neptune","Pluto","Eris"];

SB_GM = [1.32712440018 * 10^20,...
         2.2032 * 10^13,...
         3.24859 * 10^14,...
         4.9048695 * 10^12,...
         4.282837 * 10^13,...
         6.26325 * 10^10,...
         1.26686534 * 10^17,...
         3.7931187 * 10^16,...
         5.793939 * 10^15,...
         6.836529 * 10^15,...
         8.71 * 10^11,...
         1.108 * 10^12];

SB_MD = [149597870.7,...
         91691000, ...
         41400000, ...
         385000.6, ...
         78340000, ...
         414000000, ...
         628730000, ...
         1275000000, ...
         2723950000, ...
         4351400000, ...
         5890000000, ...
         96.1 * 149597870.7];

%listOfCelestrialBodys = [SB_names;SB_GM;SB_MD];

%Calcualte the gravitantional potential 

V_ext = 0;

for V_ext_i = 1:length(SB_names)

    V_ext = V_ext + (SB_GM(V_ext_i) / SB_MD(V_ext_i));

end

%Special relavistic term

Ve = 30 * 10^3; %m/s^-1
SpRe = (Ve^2)/2;

%Speed of ligthin vacuum

c = 299792458; %m/s

% Get TCBdiv

TCBdiv = TCGdiv / (1- 1/c^2 * (SpRe + V_ext));

end









