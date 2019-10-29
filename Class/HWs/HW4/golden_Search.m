function N = golden_Search(tol)
    
    tau = (sqrt(5) - 1)/2; % step size
    % [a,b] are the bounds of the region 
    a = 0; 
    b = 2;
    i = 0; % iteration counter
    
    while( (b-a) > tol) % loop continues as long as tolerance criteria is not met
        i = i + 1; % increase counter for each iteration
        % x and y are potential new boundaries based on the step size, the
        % acceptance of these new boundaries are based on where the minimum
        % can NOT be
        x = a + (1-tau)*(b-a);
        y = a + tau*(b-a);
        
        if( f(x) >= f(y) )
            a = x; % condense left side if f(x) >= f(y) 
        else
            b = y; % else condense right side
        end
        
        % return number of iterations required to meet error tolerance
        if( abs(b-a) < tol )
            N = i;
        end
        
    end

% function to be minimized
function val = f(x)
    val = 0.5 - x*exp(-x^2);
    
% it takes 40 iterations to achieve accuracy to an error tolerance of 1e-8    