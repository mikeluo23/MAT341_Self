function val = Gradient_Descent_1(tol, gamma)

% initialize initial vector, counter, and error to enter the while loop
x = [1 1.5];
i = 0;
err = 20;


while(err > tol) % run until convergence criteria is met
   i = i + 1; % add to iteration
   x1 = x - gamma*[gradX(x) gradY(x)]; % move opposite the direction of the gradient at the fixed step size
   grad_x1 = [gradX(x1) gradY(x1)]; % calculate gradient of the next step
   grad_x = [gradX(x) gradY(x)]; % calculate gradient of the current position
   err = sqrt((x1 - x) *(x1 - x)'); % calculate error
   x = x1; % next step becomes current position for the next iteration
end

val = i; % return number of iterations

% function to be optimized
function val = f(x)
    val = -(sin(x(1)) + cos(x(2)));

% partial derivative in terms of x
function val1 = gradX(x)
    val1 = -cos(x(1));
% partial derivative in terms of y
function val2 = gradY(x)
    val2 = sin(x(2));
    
% 1a) It takes 35 iterations to achieve 1e-10 accuracy using gamma = 0.5.

% 1b) It takes 12 iterations to achieve 1e-10 accuracy using gamma = 0.9.

% 1c) It takes 34 iterations to achieve 1e-10 accuracy using gamma = 1.5.