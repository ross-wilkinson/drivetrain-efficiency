%% Use iterative method to solve linear system
% Author: Ross D. Wilkinson, Ph.D. (based on Andrew Ng's Machine Learning Course)

%% Load and set measured and calculated power variables
load('dataRW.mat')
X = t.powerCalc;
y = t.powerMeas;

%% Choose some alpha value i.e. step size of descent algorithm
alpha = 0.0001;
num_iters = 400;

%% Initialize theta and run gradient descent 
theta = zeros(4, 1); % [dt1 dt2 cf1 cf2]

fprintf('Running gradient descent... \n')
[theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);

% Plot the convergence graph
figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

% Display gradient descent's result
fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n');
