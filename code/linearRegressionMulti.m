%% Use iterative method to solve linear system
% Power lost due to friction in drive train and correction factor for power
% meter bias
% Author: Ross D. Wilkinson, Ph.D. (based on Andrew Ng's Machine Learning Course)

% Input T must be a table containing columns for the following data:
%   Factor 1 - drive train
%   Factor 2 - Power meter
%   meter)
%   X - The sum of power due to gravity and rolling resistance
%   y - Mechanical power measured by the power meter

%% Load and set measured and calculated power variables
load('data422.mat')
X = t.powerCalc;
y = t.powerMeas;

%% Choose some alpha value i.e. step size of descent algorithm
alpha = 0.0001;
num_iters = 400;

%% Initialize theta and run gradient descent 
theta = zeros(4,1); % [dt1 dt2 cf1 cf2]

fprintf('Running gradient descent... \n')
[theta_history, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);

% Plot the convergence graph
figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

% Display gradient descent's result
fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta_history(end,:));
fprintf('\n');

%% Visualize gradient descent
% Grid over which we will calculate J
theta0_vals = linspace(0, 1.5, 100);
theta1_vals = linspace(0, 1.5, 100);
theta2_vals = linspace(0, 1.5, 100);
theta3_vals = linspace(0, 1.5, 100);

% initialize J_vals to a matrix of 0's
J_vals = zeros(length(theta0_vals), length(theta1_vals));

% Fill out J_vals
for i = 1:length(theta0_vals)
    for j = 1:length(theta1_vals)
	  t = [theta0_vals(i); theta1_vals(i); theta2_vals(j); theta3_vals(j)];
	  J_vals(i,j) = computeCostMulti(X, y, t);
    end
end

% Because of the way meshgrids work in the surf command, we need to
% transpose J_vals before calling surf, or else the axes will be flipped
J_vals = J_vals';
% Surface plot
figure;
surf(theta0_vals, theta2_vals, J_vals)
xlabel('\theta_{dt}'); ylabel('\theta_{cf}'); zlabel('J(\theta)')
% plot progression of theta towards solution
hold on
plot3(theta_history(:,1), theta_history(:,3),J_history,'r-o','MarkerFaceColor','r')
plot3(theta_history(:,2), theta_history(:,4),J_history,'m-o','MarkerFaceColor','m')
view(-150,30)

set(gcf,'color','w')
box on
cd('/Users/rosswilkinson/Google Drive/projects/drivetrain-efficiency/results')
% export_fig('fig_surf_J','-png','-eps','-cmyk','-r600')

% Contour plot
figure;
% Plot J_vals as 15 contours spaced logarithmically between 0.01 and 100
contour(theta0_vals, theta2_vals, J_vals./100, logspace(-2, 3, 20))
xlabel('\theta_{dt}'); ylabel('\theta_{cf}');
hold on;
plot(theta_history(end,1), theta_history(end,3), 'rx', 'MarkerSize', 10, 'LineWidth', 2);
plot(theta_history(end,2), theta_history(end,4), 'mx', 'MarkerSize', 10, 'LineWidth', 2);

% plot progression of theta towards solution
plot(theta_history(:,1), theta_history(:,3),'r-o')
plot(theta_history(:,2), theta_history(:,4),'m-o')

set(gcf,'color','w')
cd('/Users/rosswilkinson/Google Drive/projects/drivetrain-efficiency/results')
% export_fig('fig_contour_J','-png','-eps','-cmyk','-r600')
