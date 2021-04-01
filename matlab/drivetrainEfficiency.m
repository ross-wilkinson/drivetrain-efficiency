function [C_rr, P_net, E_dt, P_dt] = drivetrainEfficiency(M_r, M_b, M_h, deg, V_mmin, P_crank)
% Calculate gravity and rolling resistance power


% INPUTS:
%       - M_r:
%       - M_b:
%       - M_h:
%       - deg:
%       - V_mmin:
%       - P_crank:
%
% OUTPUTS:
%       - C_rr:
%       - P_net:
%       - E_dt:

% Calculate Crr based on coasting tests
g = 9.81;
W = (M_r + M_b) * g;
a = deg2rad(deg);
V_b =  V_mmin/60;

F_g = W * sin(a);
F_wb =  (91 + 8.7 .* V_b) / 1000;
F_wr = 0.5 * 1.2234 .* 0.0044 .* V_b.^2;
F_net = F_g + F_wb + F_wr;
C_rr = (M_h * g - F_net) / W;
F_rr = cos(a) * C_rr * W;

% Calculate sum of P_g, P_rr, P_wb, P_wr
P_g = F_g * V_b;
P_rr = F_rr * V_b;
P_wb = F_wb * V_b;
P_wr = F_wr * V_b;
P_net = P_g + P_rr + P_wb + P_wr;

% Calculate drivetrain efficiency
P_dt = P_crank - P_net;
E_dt = P_net / P_crank * 100;
