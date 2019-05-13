function [estimation]= dimensionTOOL_function(FREQUENCY,POWER,NUMUSERS,DIRECTION,DENSITY)

if (NUMUSERS<=0)
    display('NUMUSERS<=0')
    estimation.means=0;
    return
elseif(NUMUSERS<5)
    display('NUMUSERS is  low to estimate!')
end
    
if (exist('regression.mat','file')==2)
    load('regression.mat')
    display('Models loaded')
else
    display('Regression file not found.')
    estimation.means=0;
    return
end

index=getname(DIRECTION,POWER,DENSITY);
index2=getname(DIRECTION,0,DENSITY);

if(index(2)~='m')
  
    modelPERnumusers = numusersregression.(getfrequency(FREQUENCY)).means.(index);
    modelPERpower = powerregression.(getfrequency(FREQUENCY)).means.(index2);
    estimation.means=modelPERpower(POWER)+modelPERnumusers(NUMUSERS);

    modelPERpower(POWER)
    modelPERnumusers(NUMUSERS)

    modelPERnumusers = numusersregression.(getfrequency(FREQUENCY)).lower.(index);
    modelPERpower = powerregression.(getfrequency(FREQUENCY)).lower.(index2);
    estimation.lower=modelPERpower(POWER)+modelPERnumusers(NUMUSERS);

    modelPERpower(POWER)
    modelPERnumusers(NUMUSERS)
    
    
    modelPERnumusers = numusersregression.(getfrequency(FREQUENCY)).upper.(index);
    modelPERpower = powerregression.(getfrequency(FREQUENCY)).upper.(index2);
    estimation.upper=modelPERpower(POWER)+modelPERnumusers(NUMUSERS);
    
    modelPERpower(POWER)
    modelPERnumusers(NUMUSERS)
    
else
    modelPERpower = powerregression.(getfrequency(FREQUENCY)).means.(index2);
    index(2)='h';
    modelPERnumusersh = numusersregression.(getfrequency(FREQUENCY)).means.(index);
    index(2)='b';
    modelPERnumusersb = numusersregression.(getfrequency(FREQUENCY)).means.(index);
    estimation.means=(modelPERpower(POWER)+modelPERnumusersb(NUMUSERS)+modelPERpower(POWER)+modelPERnumusersh(NUMUSERS))/2;

    modelPERpower = powerregression.(getfrequency(FREQUENCY)).lower.(index2);
    index(2)='h';
    modelPERnumusersh = numusersregression.(getfrequency(FREQUENCY)).lower.(index);
    index(2)='b';
    modelPERnumusersb = numusersregression.(getfrequency(FREQUENCY)).lower.(index);
    estimation.lower=(modelPERpower(POWER)+modelPERnumusersb(NUMUSERS)+modelPERpower(POWER)+modelPERnumusersh(NUMUSERS))/2;

    modelPERpower = powerregression.(getfrequency(FREQUENCY)).upper.(index2);
    index(2)='h';
    modelPERnumusersh = numusersregression.(getfrequency(FREQUENCY)).upper.(index);
    index(2)='b';
    modelPERnumusersb = numusersregression.(getfrequency(FREQUENCY)).upper.(index);
    estimation.upper=(modelPERpower(POWER)+modelPERnumusersb(NUMUSERS)+modelPERpower(POWER)+modelPERnumusersh(NUMUSERS))/2;
    
end 

%When num. of user is too low
estimations=sort([estimation.lower estimation.means estimation.upper]);
estimation.lower=estimations(1);estimation.means=estimations(2);estimation.upper=estimations(3);
