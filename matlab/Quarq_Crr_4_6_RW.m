xValue = double.empty;
yValue = double.empty;

powerValues = [330.652 253.370 177.577 103.000 101.579 177.5 251.179 323.696];

%% Calc Crr
M_r = 161.25 / 2.205; %Rider mass in Kg (161.25 lb)
M_b = (183.5 - 161.25) / 2.205; %bike mass (183.5 - 161.75 lb = 22.25 lb)
g = 9.81; 
W = (M_r + M_b) * g;
a = 4.13;

M_h = mean([6.29857 6.24571]); %took average of weights/transducer readings at 1,5,10,15,25,30s 
mu = (M_h * g - W * sin(deg2rad(a))) / W * cos(deg2rad(a))
%mu = 0.0014;

%% 100 W at 97.84 m/min

V_b = mean([97.803 97.878]) / 60; %convert to m/s
% P_crank = mean([100.4500 102.9500]);
P_crank = mean(powerValues([4 5]));

P_rr = V_b * cos(deg2rad(a)) * mu * W;
P_gpe = V_b * sin(deg2rad(a)) * W;
P_net = P_rr + P_gpe;

xValue(1) = P_net;
yValue(1) = P_crank;

%% 175 W at 171.654 m/min

V_b = mean([171.754 171.552]) / 60; %convert to m/s
% P_crank = mean([177.55 175.65]);
P_crank = mean(powerValues([3 6]));

P_rr = V_b * cos(deg2rad(a)) * mu * W;
P_gpe = V_b * sin(deg2rad(a)) * W;
P_net = P_rr + P_gpe;

xValue(2) = P_net;
yValue(2) = P_crank;

%% 250 W at 242.0815 m/min

V_b = mean([241.831 242.332]) / 60; %convert to m/s
% P_crank = mean([253.25 248.2]);
P_crank = mean(powerValues([2 7]));

P_rr = V_b * cos(deg2rad(a)) * mu * W;
P_gpe = V_b * sin(deg2rad(a)) * W;
P_net = P_rr + P_gpe;

xValue(3) = P_net;
yValue(3) = P_crank;

%% 325 W at 315.6515 m/min

V_b = mean([314.52 316.778]) / 60; %convert to m/s
% P_crank = mean([329.9 322.35]);
P_crank = mean(powerValues([1]));

P_rr = V_b * cos(deg2rad(a)) * mu * W;
P_gpe = V_b * sin(deg2rad(a)) * W;
P_net = P_rr + P_gpe;

xValue(4) = P_net;
yValue(4) = P_crank;

%% Plot and report
figure (1);
hold on;
scatter(xValue, yValue);
hl = lsline;
B = [ones(size(hl.XData(:))), hl.XData(:)]\hl.YData(:);
Slope = B(2)
xlabel('Pg+Pr');
ylabel('Pc');

c = fitlm(xValue, yValue)

