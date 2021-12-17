%% Calculate C_rr and drivetrain efficiency

g = -9.81;

%% Ross at 241.1 m/min
M_r = 84.581;
M_b = 10.771;
W = (M_r + M_b) * g;
a = 4.13;

M_h = 7.0;

mu = (M_h * g - W * sin(deg2rad(a))) / W*cos(deg2rad(a));

%% Drew
M_r = 72.69;
M_b = 10.7110;
W = (M_r + M_b) * g;
a = 4.13;

M_h = mean([6.0702, 6.1031 6.1364]);

mu = (M_h * g - W * sin(deg2rad(a))) / W * cos(deg2rad(a))

%% Rodger w/ spring at 241.1 m/min
M_r = 67.4;
M_b = 10.55;
W = (M_r + M_b) * g;
a = 4.13;

M_h = mean(Fnet); % 5.7469

mu = (M_h * g - W * sin(deg2rad(a))) / W * cos(deg2rad(a))

%% Rodger w/o spring at 241.1 m/min
M_r = 67.4;
M_b = 10.491;
W = (M_r + M_b) * g;
a = 4.13;

M_h = mean(Fnet_sans); % 5.8362

mu = (M_h * g - W * sin(deg2rad(a))) / W * cos(deg2rad(a))

%% Drew w/o spring at 241.1 m/min

M_r = 67.4;
M_b = 10.491;
W = (M_r + M_b) * g;
a = 4.13;

M_h = mean(Fnet_sans); % 5.8362
V_b1 = mean([241.65 241.57 241.50 241.64 241.58 241.34 240.84 242.13 242.14]);
V_b2 = mean([240.86 241.37 241.65 240.96 241.01 241.08 240.82 241.16 241.41]);

mu = (M_h * g - W * sin(deg2rad(a))) / W * cos(deg2rad(a))

%% 100 W at 96.4 m/min
M_h = 5.81;
V_b = mean([96.81 96.43]) / 60;
P_crank = mean([99.3667 99.2]);

P_rr = V_b * cos(deg2rad(a)) * mu * W;
P_gpe = V_b * sin(deg2rad(a)) * W;
P_net = P_rr + P_gpe;
E_dt = P_net / P_crank * 100;

xValue(1) = P_net;
yValue(1) = P_crank;

%% 175 W at 168.8 m/min
M_h = 5.81 + 0.2602;
V_b = mean([169.28 169.86]) / 60;
P_crank = mean([176.03 171.43]);

P_rr = V_b * cos(deg2rad(a)) * -mu * W;
P_gpe = V_b * sin(deg2rad(a)) * W;
P_net = P_rr + P_gpe;
E_dt = P_net / P_crank * 100;

xValue(2) = P_net;
yValue(2) = P_crank;

%% 250 W at 241.1 m/min
M_h = 5.81 + 0.2931;
V_b = mean([240.95 241.75]) / 60;
P_crank = mean([249.4667 246]);

P_rr = V_b * cos(deg2rad(a)) * -mu * W;
P_gpe = V_b * sin(deg2rad(a)) * W;
P_net = P_rr + P_gpe;
E_dt = P_net / P_crank * 100;

xValue(3) = P_net;
yValue(3) = P_crank;

%% 325 W at 313.4 m/min
M_h = 5.81 + 0.3264;
V_b = mean([312.84 314.45]) / 60;
P_crank = mean([323.13 315.5]);

P_rr = V_b * cos(deg2rad(a)) * -mu * W;
P_gpe = V_b * sin(deg2rad(a)) * W;
P_net = P_rr + P_gpe;
E_dt = P_net / P_crank * 100;

xValue(4) = P_net;
yValue(4) = P_crank;

