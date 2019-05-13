function [name] = getname(DIRECTION,POWER,DENSITY)

if(strcmp(DIRECTION,'UPSTREAM'))
    name='u';
else
    name='d';
end

if (POWER==0)
    POWER_E='NONE';
elseif(POWER<-45)
    POWER_E='LOW';
elseif(POWER>-35)
    POWER_E='HIGH';
else
    POWER_E='MEDIUM';
end

if(strcmp(POWER_E,'LOW'))
    name=[name 'b'];
elseif(strcmp(POWER_E,'MEDIUM'))
    name=[name 'm'];
elseif(strcmp(POWER_E,'HIGH'))
    name=[name 'h'];
end

if(strcmp(DENSITY,'LOW'))
    name=[name 'l'];
else
    name=[name 'h'];
end
