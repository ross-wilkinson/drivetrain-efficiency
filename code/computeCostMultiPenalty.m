function J = computeCostMultiPenalty(X, y, theta)
%COMPUTECOSTMULTI Compute cost for linear regression with multiple variables
% J = COMPUTECOSTMULTI(X, y, theta) computes the cost of using theta as the
% parameter for linear regression to fit the data points in X and y
% Author: Ross D. Wilkinson, Ph.D. (based on Dr. Andrew Ng's Machine Learning Course)

%% Initialize some useful values
m = length(y)/2; % number of training examples

%% Use current theta values for prediction
h(1,1) = theta(1) * theta(3) * X(1); % dt1 * cf1
h(2,1) = theta(1) * theta(4) * X(2); % dt1 * cf2
h(3,1) = theta(2) * theta(3) * X(3); % dt2 * cf1
h(4,1) = theta(2) * theta(4) * X(4); % dt2 * cf2
h(5,1) = theta(1) * theta(3) * X(5); % dt1 * cf1
h(6,1) = theta(1) * theta(4) * X(6); % dt1 * cf2
h(7,1) = theta(2) * theta(3) * X(7); % dt2 * cf1
h(8,1) = theta(2) * theta(4) * X(8); % dt2 * cf2
h(9,1) = theta(1) * theta(3) * X(9); % dt1 * cf1
h(10,1) = theta(1) * theta(4) * X(10); % dt1 * cf2
h(11,1) = theta(2) * theta(3) * X(11); % dt2 * cf1
h(12,1) = theta(2) * theta(4) * X(12); % dt2 * cf2

%% Compute the cost of a particular choice of theta values
J = sum((h-y).^2)/(2*m);

%% Apply penalty term to unrealistic drivetrain efficiency (<1)
% if theta(1) < 1 || theta(2) < 1
%     J = J + 1e5;
% end

end
