%% LastDayFromTheMothBefore
% Discription:
% Computes The day and Year from the Month before
% usage:
% [yyyy,mm] = LastDayFromTheMothBefore(mm,dd)
% input:
% yyyy = Gregorian calender years
% mm = Gregorian calender month
% dd = Gregorian calender days
% output:
% yyyy = years
% mm = moth
% external calls:
% none

function [yyyy,mm,dd] = LastDayFromTheMothBefore(yyyy,mm)

% Value checks:

if (~isnumeric(yyyy))
    error("yyyy are not numeric")
end
if (~isnumeric(mm))
    error("mm are not numeric")
end
if (mm<1 || mm>12)
    error("month must be a number between 1 and 12")
end

%find out if there is an leap year

DaysInMonth = [31,28,31,30,31,30,31,31,30,31,30,31];

leapyear = false;

if(rem(yyyy,4)==0)
    leapyear = true;

    if(rem(yyyy,100)==0 && rem(yyyy,400)~=0)
        leapyear = false;
    end

end

if(leapyear)
    DaysInMonth(2)=29;
end

mm = mm-1;

if(mm==0)

    mm = mm+12;
    yyyy = yyyy-1;

end

dd = DaysInMonth(mm);

end








  
