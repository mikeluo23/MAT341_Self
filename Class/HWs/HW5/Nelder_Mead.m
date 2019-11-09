function N = Nelder_Mead(tol)

% initial starting values (commented values represent different parts of the
% problem
x1 = [0.35 2.8];
%x2 = [-0.25 0.3];
%x2 = [1.75 0.10];
x2 = [4 4];
%x3 = [1.5 0.5];
x3 = [4.5 4.5];

% storing initial points in a matrix and their function values in a row
% vector
x = [x1; x2; x3];
fs = [f(x1) f(x2) f(x3)];

% initialize err and number of iterations
err = 20; % set to # > tol so the while loop can be entered
i = 0;

    while (err > tol)
        i = i + 1;
        
        %receives value and index of the sorted function vector
        [val, idx] = sort(fs);
        
        % sorts function vector and point matrix so that f(x1) <= f(x2) <=
        % f(x3). Sorting of the points are based off of function values
        fsorted = [fs(idx(1)) fs(idx(2)) fs(idx(3))];
        x_new = [x(idx(1),:); x(idx(2),:); x(idx(3),:)];
        
        % computes midpoint and reach vector
        x_m = (x_new(1,:) + x_new(2,:)) / 2;
        x_r = 2*x_m - x_new(3,:);
        
        % performs Nelder Mead algorithm based on com
        if(f(x_r) < f(x_new(3,:)))
            x_new(3,:) = x_r; % x3 becomes reach vector and the triangle inverted
            
        elseif(f(x_r) > f(x_new(3,:)))
            x_c = .5*(x_new(3,:) + x_m); % creates vector between the midpoint and x3
            
            if(f(x_c) < f(x_new(3,:)))
                x_new(3,:) = x_c;
            
            else % triangle between the three points is shrunk in direction of x1
                x_new(2,:) = .5*(x_new(2,:)+ x_new(1,:));
                x_new(3,:) = .5*(x_new(3,:) + x_new(1,:));
                
            end
        end
        
        % redefines the function values vector and point matrix
        fs = [f(x_new(1,:)) f(x_new(2,:)) f(x_new(3,:))];
        x = [x_new(1,:); x_new(2,:); x_new(3,:)];
        
        % recalculates error
        err = abs(f(x_new(1,:)) - f(x_new(3,:)));
        
    end
%f(x_new(3,:))
%x_new(3,:)

N = i;
    
function val = f(x)
    val = -(sin(x(1)) + cos(x(2)));
    
% 1a) It takes 29 iterations to achieve 1e-8 accuracy.

% 1b) For the initial points listed above, the algorithm appears to
% converge to approximately (1.57119504, -0.00094973), which is roughly (pi/2, 0). The true point that
% the minima is located is (pi/2, 0). While the points don't look exactly
% like 1e-8 accuracy (especially the y-coordinate), the algorithm measures
% accuracy based on the function value which is about -1.99999947, which is
% accurate for the first 7 digits, meaning that 1e-8 accuracy was achieved.

% 1c) It took 58 iterations to achieve 1e-8 accuracy. It located the same
% minima as part a (the initial points). Even though the initial value was
% changed to a point that is closer to the local minima found in part a
% (and c) it also created a larger triangle between the three given points.
% Thus, this created a larger reach vector in the initial iterations of the
% algorithm. Therefore, it was exploring a larger area of the cartesian
% plane, forcing it to take longer to converge to a single point.

% 1d) It finds the minima of approximately -2, just like the previous initial
% conditions but it found it at approximately (-3pi/2, 0). In polar
% coordinates, it is the same as part a, but numerically different.