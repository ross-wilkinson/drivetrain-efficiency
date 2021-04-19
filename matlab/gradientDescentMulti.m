function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
% theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates
% theta by taking num_iters gradient steps with learning rate alpha
% Author: Ross D. Wilkinson, Ph.D. (based on Dr. Andrew Ng's Machine Learning Course)

%% Initialize some useful values
m = length(y)/2; % number of training examples per element of theta
J_history = zeros(num_iters, 1);

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
    
    % Calculate the contribution of each element in theta to the total
    % magnitude and direction of error
    delta(1) = sum([h(1)-y(1) h(2)-y(2) h(5)-y(5) h(6)-y(6)])/m;
    delta(2) = sum([h(3)-y(3) h(4)-y(4) h(7)-y(7) h(8)-y(8)])/m;
    delta(3) = sum([h(1)-y(1) h(3)-y(3) h(5)-y(5) h(7)-y(7)])/m;
    delta(4) = sum([h(2)-y(2) h(4)-y(4) h(6)-y(6) h(8)-y(8)])/m;
    
    % Update theta
    theta(1) = theta(1)-alpha*delta(1);
    theta(2) = theta(2)-alpha*delta(2);
    theta(3) = theta(3)-alpha*delta(3);
    theta(4) = theta(4)-alpha*delta(4);

    % Save the cost J in every iteration    
    J_history(iter) = computeCostMulti(X, y, theta);
    
end

end
