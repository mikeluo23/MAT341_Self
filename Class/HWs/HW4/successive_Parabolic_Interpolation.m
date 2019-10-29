function N = successive_Parabolic_Interpolation(tol)
    
    % x1, x2, x3 are initial points in parabola
    x1 = 0;
    x2 = 0.6;
    x3 = 1.2;
    %x3 = 2;
    i = 0; % iteration counter
    
    % continues running if any of the 3 points are not within given
    % tolerance
    while ( abs(x1 - x2) > tol || abs(x1 - x3) > tol || abs(x3 - x2) > tol)
        i = i + 1; % increase iteration count per iteration
        
        % creates a matrix to solve for a, b, and c of parabola ax^2+bx+c=0
        mat = [x1^2 x1 1 f(x1); x2^2 x2 1 f(x2); x3^2 x3 1 f(x3)];
        vals = rref(mat); % row reduced echelon form of matrix, right-most column gives values of a, b, and c respectively
        vertex = -vals(2,4)/(2*vals(1,4)); % finds vertex -b/2a
        
        % using inverse matrix to solve linear equation, above uses rref
        % (seemingly more efficient)
        %mat = [x1^2 x1 1; x2^2 x2 1; x3^2 x3 1];
        %sols = [f(x1); f(x2); f(x3)];
        %vals = inv(mat)*sols;
        %vertex = -vals(2)/(2*vals(1));
        
        
        % switches points accordingly until all three converge to a
        % singular point
        x1 = x2;
        x2 = x3;
        x3 = vertex;
        
    end

    N = i; % returns number of iterations
   
% function to be minimized    
function val = f(x)
    val = 0.5 - x*exp(-x^2);
% to achieve 1e-8 accuracy with these initial guesses, it takes 157
% iterations

% It took 357 iterations to find a minimum of this function. I did not
% receive any errors. This is because my algorithm uses rref rather than
% inverting matrices. When rewriting the algorithm to use inverse matrices to solve the linear equation, an
% error was thrown about singular matrices. At certain iterations, the
% matrix becomes singular (or close to) based on the points
% (non-invertible). Therefore MATLAB must use approximations for certain
% values which lead to inaccuracies in the algorithm. In this case,
% the algorithm took 983 iterations to complete. Using rref actually avoids
% this because row reducing does not require a matrix to be invertible and
% finding the vertex of the parabola does not require the respective c
% value.