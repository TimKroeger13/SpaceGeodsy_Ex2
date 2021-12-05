%% TTdiv_To_TCGdiv
% Discription:
% Calculates Geocentric Coordinate Time difference (TCGdiv) from given 
% Terrestrial Time (TTdiv) difference.
% usage:
% [TCGdiv] = TTdiv_To_TCGdiv(TTdiv)
% input:
% TTdiv = Terrestrial Time difference
% output:
% TTdiv = Geocentric Coordinate Time difference
% external calls:
% none

function [TCGdiv] = TTdiv_To_TCGdiv(TTdiv)

LG = 6.969290134 * 10^-10;

TCGdiv =  (1 + (LG / (1-LG))) * TTdiv;

end