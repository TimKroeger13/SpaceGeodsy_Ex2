%% get_equinox
% Discription:
% Gets the equinox
% usage:
% [equinox] = get_equinox(yyyy,mm,dd,jd_UT1)
% input:
% output:
% equinox = the equinox
% external calls:
% Fx=F(x)
% gre2jd(yyyy,mm,dd,hour,minute,second)

function [equinox] = get_equinox(yyyy,mm,dd,jd_UT1)

% Value checks:

if (~isnumeric(jd_UT1))
    error("jd_UT1 are not numeric")
end
if (~isnumeric(yyyy))
    error("yyyy are not numeric")
end
if (~isnumeric(mm))
    error("mm are not numeric")
end
if (~isnumeric(dd))
    error("dd are not numeric")
end

if (mm<1 || mm>12)
    error("month must be a number between 1 and 12")
end
if (dd<1 || dd>31)
    error("Day must be a number between 1 and 12")
end



%Calculations
%Calculaue delta_psi

IAU = readtable('IAU1980.txt');
ALL_delta_psi = IAU(:,15); %Δ𝜓

%Metadata for IAU1980.txt
%Time Start = 1973-01-02
%Endtime = 2023-01-29

%Star mjg
[~,Smjd] = gre2jd(1973,01,02,0,0,0);

%Wanted mjg
[~,Wmjd] = gre2jd(yyyy,mm,dd,0,0,0);

IAU_day = (Wmjd-Smjd)+1;

delta_psi = ALL_delta_psi(IAU_day,1); %rad

delta_psi = delta_psi.Var15;

delta_psi = delta_psi * 4.8481368E-9;

%

t = (jd_UT1-2451545.0) / 36525;

%Calculaue E_0

E_0 = (84381.448 - 46.8150*t - 5.9 * 10^-4 * t^2 + 1.1813 ...
    * 10^-3 *t^3)*(pi/648000);

%Calculaue Omega

Omega = (450160.28 - 482890.539 * t + 7.455 * t^2 + 0.008 * t^3) *...
    (pi/648000) + 2*pi * F(-5*t);

%Calculate the equinox

equinoxRad = delta_psi * cos(E_0) + (2.64 * 10^-3 * sin(Omega) + 6.3 *...
    10^-5 * sin(2*Omega)) * (pi/648000);

equinox = equinoxRad * (12/pi);

end


