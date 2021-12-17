%% createDataTable

% drivetrain 1 = dry, 2 = lubricated
% powermeter 1 = ultegra, 2 = dura-ace

driveTrain = [1; 1; 2; 2; 1; 1; 2; 2; 1; 1; 2; 2];
powerMeter = [1; 2; 1; 2; 1; 2; 1; 2; 1; 2; 1; 2];

% Load mean data
load('data422.mat')
powerCalc = [tCalc{1,4}; tCalc{1,3}; tCalc{1,1}; tCalc{1,2};...
    tCalc{2,4}; tCalc{2,3}; tCalc{2,1}; tCalc{2,2};...
    tCalc{3,4}; tCalc{3,3}; tCalc{3,1}; tCalc{3,2}];
powerMeas = [tMeas{1,4}; tMeas{1,3}; tMeas{1,1}; tMeas{1,2};...
    tMeas{2,4}; tMeas{2,3}; tMeas{2,1}; tMeas{2,2};...
    tMeas{3,4}; tMeas{3,3}; tMeas{3,1}; tMeas{3,2}];

t = table(driveTrain,powerMeter,powerCalc,powerMeas);

% Save data from RW processing
save('data422_supp.mat','t','tMeas','tCalc')