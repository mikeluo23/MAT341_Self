function val = Gradient_Descent_2(tol)

% initialize starting vector, counter, err to enter while loop, and
% initial step-size
x = [1 1.5];
i = 0;
err = 20;
gamma = 0.5;

while(err > tol)
   i = i + 1; % increase counter
   x1 = x - gamma*[gradX(x) gradY(x)]; % step opposite of the direction of the gradient at the given step-size
   grad_x1 = [gradX(x1) gradY(x1)]; % calculate gradient at next point
   grad_x = [gradX(x) gradY(x)]; % store gradient of current position
   gamma = ((x1 - x)*(grad_x1 - grad_x)')/( sqrt( (grad_x1 - grad_x) * (grad_x1 - grad_x)') )^2; % update step-size based on barzilai-borwein step-size
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

    
% 3a) It takes 6 iterations to achieve 1e-6 accuracy using the
% Barzilai-Borwein step-size.

% 3b) It takes 7 iterations to achieve 1e-10 accuracy using the
% Barzilai-Borwein step-size.