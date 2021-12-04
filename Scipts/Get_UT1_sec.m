%% Get_UT1_sec
% Discription:
% Computes the UT1 second from gregorian calender dates
% usage:
% [UT1_sec] = Get_UT1_sec(yyyy,mm,dd,hour,minute,second)
% input:
% yyyy = Gregorian calender years
% mm = Gregorian calender month
% dd = Gregorian calender days
% hour = Gregorian calender hours
% minute = Gregorian calender minutes
% second = Gregorian calenderseconds
% output:
% UT1_sec = UT1 second
% external calls:
% gre2jd(yyyy,mm,dd,hour,minute,second)
% LastDayFromMothTheBefore(yyyy,mm)

function [yyyy,mm,dd,hour,minute,UT1_sec] = Get_UT1_sec(yyyy,mm,dd,hour,minute,second)


if (~isnumeric(yyyy))
    error("yyyy are not numeric")
end
if (~isnumeric(mm))
    error("mm are not numeric")
end
if (~isnumeric(dd))
    error("dd are not numeric")
end
if (~isnumeric(hour))
    error("hour are not numeric")
end
if (~isnumeric(minute))
    error("minute are not numeric")
end
if (~isnumeric(second))
    error("second are not numeric")
end

if (mm<1 || mm>12)
    error("month must be a number between 1 and 12")
end
if (dd<1 || dd>31)
    error("Day must be a number between 1 and 12")
end
if (hour<0 || hour>23)
    error("Hour must be a number between 1 and 12")
end
if (minute<0 || minute>59)
    error("Minute must be a number between 1 and 12")
end
if (second<0 || second>=60)
    error("Second must be a number between 1 and 12")
end

IAU = readtable('IAU1980.txt');
dUT1 = IAU(:,10); %s

%Metadata for IAU1980.txt
%Time Start = 1973-01-02
%Endtime = 2023-01-29

%Star mjg
[~,Smjd] = gre2jd(1973,01,02,0,0,0);

%Wanted mjg
[~,Wmjd] = gre2jd(yyyy,mm,dd,0,0,0);

IAU_day = (Wmjd-Smjd)+1;

dUT1_Value = dUT1(IAU_day,1);

UT1_sec = second+dUT1_Value.Var10;

%adjustment if the seconds changes more time data

if(UT1_sec<0)

    UT1_sec = UT1_sec+60;
    minute = minute-1;

    if(minute<0)
        
        minute = minute+60;
        hour = hour-1;

        if(hour<0)

            hour = hour+24;
            dd = dd-1;
   
            if(dd==0)
                [yyyy,mm,dd] = LastDayFromTheMothBefore(yyyy,mm);
            end
        end
    end
end

if(UT1_sec>60)

    UT1_sec = UT1_sec-60;
    minute = minute+1;

    if(minute>59)
        
        minute = minute-60;
        hour = hour+1;

              if(hour>23)
                  
                  hour = hour-24;
                  dd = dd+1;
               
                  DaysInMonth = [31,28,31,30,31,30,31,31,30,31,30,31];

                  if(dd>DaysInMonth(mm))

                      dd=1;
                      mm = mm+1;

                      if(mm>12)

                          mm=mm-12;
                          yyyy = yyyy+1;

                      end
                  end
              end
   end
end
end







