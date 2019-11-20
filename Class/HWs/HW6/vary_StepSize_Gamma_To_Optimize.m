function vary_StepSize_Gamma_To_Optimize()

% initialize tolerance and the gamma range to sweep across
tol = 10e-8;
gamma = 0.05:0.01:1.5;

% find number of iterations for each step-size in the vector
for i = 1:length(gamma)
    gradDescentVec(i) = Gradient_Descent_1(tol, gamma(i));
end

% Used to find minimum more precisely
%[val, idx] = min(gradDescentVec) 
%gamma(idx)

% plot log(step-size) v. iterations
figure(1)
semilogx(gamma, gradDescentVec, 'b', 'LineWidth', 5);
xlabel('log gamma');
ylabel('iterations');
title('iterations v. log gamma');
legend('Fixed Step');

% plot step-size v. iterations
% Used as a second visualization
%figure(2)
%plot(gamma, gradDescentVec, 'b', 'LineWidth', 5);
%xlabel('gamma');
%ylabel('iterations');
%title('iterations v. log gamma');
%legend('Fixed Step');

% initially tried [0.1, 2] but the iterations shot up after approximately
% gamma = 1.9, so I redetermined the gamma range to [0.05, 1.5]

% Two plots were produced because both semilogx and plot were beneficial in
% this exercise.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2a) The optimal gamma value for the given tolerance is gamma = 1 (gives 5
% iterations).