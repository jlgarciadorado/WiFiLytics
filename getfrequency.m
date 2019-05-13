function [frequencyname] = getfrequency(FREQUENCY)

if(strcmp(FREQUENCY,'5GHz'))
    frequencyname='five';
elseif(strcmp(FREQUENCY,'2.4GHz'))
    frequencyname='twofour';
else
    frequencyname='err';
end