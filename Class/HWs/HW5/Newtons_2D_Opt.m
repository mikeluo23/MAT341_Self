function val = Newtons_2D_Opt(tol)
    %x_n = [-0.25; 0.25];
    x_n = [-4.5; 4.5]; %initialize first initial point
    err = 1; %  initialize error to enter loop
    i = 0; % iteration counter
    
    while(err > tol)
        i = i + 1; % increase iteration by 1
        x_n1 = x_n - (inv(H(x_n(1), x_n(2))) * nab(x_n(1), x_n(2))); % calculate next iteration
        err = sqrt( (x_n1 - x_n)' * (x_n1 - x_n) ); % calculate error
        x_n = x_n1; % move to next iteration
        
    end
val = i; % returns iteration
f(x_n(1), x_n(2)) % function value of optimal point
x_n % location of local minimum


function grad = nab(x,y) % gradient
    grad = [-cos(x); sin(y)];

function val2 = f(x,y) % function to be optimized
    val2 = -(sin(x)+cos(y));
    
function hessian = H(x,y) %hessian matrix
    hessian = [sin(x) 0;0 cos(y)];
    
% 4a) It took 5 iterations to find the minima of -2 located at
% approximately (-3pi/2, 0).

% 4b) It took 4 iterations to find the minima of -2 located at the same
% point as part a at approximately (-3pi/2, 0)