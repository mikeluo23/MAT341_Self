% approach: take any two numbers, find the multiples of each number up to
% x*y, store these values in two matrices and find the smallest value that
% is contained in both matrices => that is the lcm

function lcm_val = calculate_LCM(x,y)
    % finds all multiples up to x*y
    for i = 1:y
        xVec(i) = x * i; 
    end
    % finds all multiples up to x*y
    for i = 1:x
        yVec(i) = y * i;
    end

% lcm is the smallest value that is contained in both vectors    
lcm_val = min(intersect(xVec, yVec));