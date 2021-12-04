%% CET_hour_To_UTC_hour
% Discription:
% Computes the UTC Hours from CET Hours
% usage:
% [yyyy,mm,dd,UTC_hour] = CET_hour_To_UTC_hour(yyyy,mm,dd,CET_hour)
% input:
% mm = Gregorian calender month
% dd = Gregorian calender days
% hour = Gregorian calender hours
% output:
% UTC_hour = Time offset that have to be added to CET
% to get UTC Hours
% external calls:
% LastDayFromTheMothBefore(yyyy,mm)

function [yyyy,mm,dd,UTC_hour] = CET_hour_To_UTC_hour(yyyy,mm,dd,CET_hour)

% Value checks:

if (~isnumeric(yyyy))
    error("yyyy are not numeric")
end
if (~isnumeric(mm))
    error("mm are not numeric")
end
if (~isnumeric(dd))
    error("day are not numeric")
end
if (~isnumeric(CET_hour))
    error("CET_hour are not numeric")
end
if (mm<1 || mm>12)
    error("month must be a number between 1 and 12")
end
if (dd<1 || dd>31)
    error("day must be a number between 1 and 31")
end
if (CET_hour<0 || CET_hour>24)
    error("CET_hour must be a number between 0 and 24")
end


%Check if its is summer or Winter time

summertime = false;

if(mm >= 4 && mm <= 8)
    summertime = true;
end
    
if(mm==3)
    if(dd>28)
        summertime = true;
    end
    if(dd==28)
        if(CET_hour>=3)
            summertime = true;
        end
    end
end

if(mm==9)
    if(dd<31)
        summertime = true;
    end
    if(dd==31)
        if(CET_hour<3)
            summertime = true; 
        end
    end
end

%calculate time

if(summertime)

    %during summer time: CEST = CET + 1h= UTC + 2h
    UTC_hour = CET_hour-2;

        if(UTC_hour<0)

            UTC_hour = UTC_hour+24;
            dd = dd-1;

            if(dd==0)
                [yyyy,mm,dd] = LastDayFromTheMothBefore(yyyy,mm);
            end
        end
else

    %during winter time: CEWT=CET = UTC + 1h
    UTC_hour = CET_hour-1;

    if(UTC_hour<0)

        UTC_hour = UTC_hour+24;
        dd = dd-1;

            if(dd==0)
                [yyyy,mm,dd] = LastDayFromTheMothBefore(yyyy,mm);
            end
    end
end
end



