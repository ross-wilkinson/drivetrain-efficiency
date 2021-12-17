function [theta_history, J_history] = gradientDescentMulti3(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
% theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates
% theta by taking num_iters gradient steps with learning rate alpha
% Author: Ross D. Wilkinson, Ph.D. (based on Dr. Andrew Ng's Machine Learning Course)

%% Initialize some useful values
m = length(y)/2; % number of training examples per element of theta
J_history = zeros(num_iters, 1);
theta_history = zeros(num_iters, 4);

%% Perform gradient steps on each element of theta
for iter = 1:num_iters
    
    % Use current theta values for prediction
    h(1,1) = theta(1) * theta(3) * X(1);
    h(2,1) = theta(1) * theta(4) * X(2);
    h(3,1) = theta(2) * theta(3) * X(3);
    h(4,1) = theta(2) * theta(4) * X(4);
    h(5,1) = theta(1) * theta(3) * X(5);
    h(6,1) = theta(1) * theta(4) * X(6);
    h(7,1) = theta(2) * theta(3) * X(7);
    h(8,1) = theta(2) * theta(4) * X(8);
    h(9,1) = theta(1) * theta(3) * X(9);
    h(10,1) = theta(1) * theta(4) * X(10);
    h(11,1) = theta(2) * theta(3) * X(11);
    h(12,1) = theta(2) * theta(4) * X(12);
    
    % Calculate the contribution of each element in theta to the total
    % magnitude and direction of error
    delta(1) = sum([h(1)-y(1) h(2)-y(2) h(5)-y(5) h(6)-y(6) h(9)-y(9) h(10)-y(10)])/m;
    delta(2) = sum([h(3)-y(3) h(4)-y(4) h(7)-y(7) h(8)-y(8) h(11)-y(11) h(12)-y(12)])/m;
    delta(3) = sum([h(1)-y(1) h(3)-y(3) h(5)-y(5) h(7)-y(7) h(9)-y(9) h(11)-y(11)])/m;
    delta(4) = sum([h(2)-y(2) h(4)-y(4) h(6)-y(6) h(8)-y(8) h(10)-y(10) h(12)-y(12)])/m;
    
    % Update theta
%     if theta(1) < 1
%         theta(1) = theta(1)-alpha*-delta(1);
%     else
%         theta(1) = theta(1)-alpha*delta(1);
%     end
%     
%     if theta(2) < 1
%         theta(2) = theta(2)-alpha*-delta(2);
%     else
%         theta(2) = theta(2)-alpha*delta(2);
%     end
    
    theta(1) = theta(1)-alpha*delta(1);
    theta(2) = theta(2)-alpha*delta(2);
    theta(3) = theta(3)-alpha*delta(3);
    theta(4) = theta(4)-alpha*delta(4);

    % Save the cost J in every iteration    
    J_history(iter) = computeCostMultiPenalty(X, y, theta);
    
    % Save theta values in every iteration
    theta_history(iter,:) = theta;
end

end
