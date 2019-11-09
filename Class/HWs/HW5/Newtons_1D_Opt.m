function N = Newtons_1D_Opt(tol)
    n = 1; % iteration counter; initialized at 1 rather than 0 because there was one iteration performed outside of the while loop
    x(n) = 0.25; % initial condition
    %x(n) = 1.5;
    
    x(n+1) = x(n) - (firstD(x(n))/secondD(x(n))); %performs first iteration of the method

    % runs algorithm until consecutive iterations can produce function
    % values within the user inputted tolerance
    while ( abs(f(x(n+1)) - f(x(n))) > tol ) 
        
        n = n + 1; % adds one to iteration counter for each iteration performed
        x(n+1) = x(n) - (firstD(x(n))/secondD(x(n))); % performs iteration
        
    end
% Three lines below allow user to see progression of the algorithm    
%plot(x(1:n))
%f(x(1:n))
%x(1:n)

N = n; % outputs number of iterations required

% function to be optimized
function val = f(x)
    val = 0.5-x.*exp(-x.^2);
% first derivative
function val1 = firstD(x)
    val1 = (2*x^2-1)*exp(-x^2);
% second derivative    
function val2 = secondD(x)
    val2 = -(4*x^3 - 6*x)*exp(-x^2);

    
% 2a) It took 5 iterations to achieve 1e-8 accuracy with the initial
% guess x_1 = 0.25.

% 2b) The algorithm found a different minimum in that function at
% approximately 0.5 (rather than 0.071 like x0 = 0.25 did). It is likely
% that the algorithm traversed to the right of the initial point where the
% function seems to converge to 0.5 as x approaches infinity.