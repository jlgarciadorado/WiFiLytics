%WiFiLytics uses Matlab, tested in version R2016 a
%Input parameters
FREQUENCY='5GHz'            %'5GHz' or '2.4GHz'
POWER=-40                   %-65 < > -20
NUMUSERS=25                 %1 < > 60
DIRECTION='DOWNSTREAM'      %'UPSTREAM' or 'DOWNSTREAM'
DENSITY='HIGH'              %'HIGH' or 'LOW'



if (exist('regression.mat','file')~=2)
    display('Regression file not found!')
else
    load('regression.mat')
    display('Models loaded')

    estimation=dimensionTOOL_function(FREQUENCY,POWER,NUMUSERS,DIRECTION,DENSITY)
    if(estimation.means==0)
        display('Err: dimensionTOOL_function()')
    end

    %plot errobars
    errorbar(NUMUSERS,estimation.means, estimation.means-estimation.lower, estimation.upper-estimation.means ,'o')
    errorbar(NUMUSERS,estimation.means, estimation.means-estimation.lower, estimation.upper-estimation.means ,'o')
    title(['Estimation for FREQUENCY:' FREQUENCY ', POWER:' num2str(POWER) ', NUMUSERS:' num2str(NUMUSERS)  ', DIRECTION:' DIRECTION  ', DENSITY:' DIRECTION        ])
    legend(['Mean= ' num2str(round(estimation.means)) 'Mb/s,  95th= ' num2str(round(estimation.upper)) 'Mb/s,  5th=' num2str(round(estimation.lower)) 'Mb/s'])
    xlabel('Num. users')
    ylabel('Mb/s')
end
