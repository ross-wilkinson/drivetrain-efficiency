%% createDataTable

driveTrain = [1; 1; 2; 2; 1; 1; 2; 2];
powerMeter = [1; 2; 1; 2; 1; 2; 1; 2];

% Load mean data
powerCalc = [173.6528; 173.2692; 172.6925; 173.0414; 317.9463; 317.3092; 317.2114; 316.4741];
powerMeas = [179.4250; 180.5441; 183.8511; 179.5070; 333.2273; 330.6102; 332.2333; 333.4063];

t = table(driveTrain,powerMeter,powerCalc,powerMeas);

% Save data from RW processing
save('dataRW.mat','t')