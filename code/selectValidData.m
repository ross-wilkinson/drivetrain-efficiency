%% Select valid period of data from trial

% Initialize
clear;clc;close all

% Set file name
fileName = '4_13_Cond2';

% Load data
data = readtable([fileName '.csv']);

% Plot power and cadence
plot(data.watts)
yyaxis right
plot(data.cad)

% Select valid trial period
m = 4; % number of trials
[x,~] = ginput(m*2);

% Calculate mean power
S.mean175 = mean(data.watts(round([x(1):x(2) x(7):x(8)])));
S.mean325 = mean(data.watts(round([x(3):x(4) x(5):x(6)])));

% Save mean data
cd '/Users/rosswilkinson/Google Drive/projects/drivetrain-efficiency/data'
save([fileName '_mean'],'S')
