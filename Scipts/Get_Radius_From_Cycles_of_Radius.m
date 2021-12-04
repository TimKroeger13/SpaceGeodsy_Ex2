%% Get_Radius_From_Cycles_of_Radius
% Discription:
% Get the Pi values from multiple cycles of a Radius.
% usage:
% [radius] = Get_Radius_From_Cycles_of_Radius(radius)
% input:
% radius = radius
% output:
% radius = The radius where 0>= radius <= 2pi
% external calls:
% none

function [radius] = Get_Radius_From_Cycles_of_Radius(radius)

% Value checks:

if (~isnumeric(radius))
    error("radius is not numeric")
end

%calculations

while radius>(2*pi)

    radius = radius - (2*pi);

end
while radius<0

    radius = radius + (2*pi);

end
end







