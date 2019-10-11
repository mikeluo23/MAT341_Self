% r = 0.01 => Prob = ~0.96
% r = 0.1 => Prob = ~0.64
% r = 0.5 => Prob = 0

% approach: for each radius in rVec, call the
% estimate_Coin_In_Square_Probability function and store each probability
% in a vector. Plot the Probability (y-axis) against its respective radius
% (x-axis)
function varyRadiiPlot()
    N = 100000; % set as number of trials
    
    rVec = [0.01:0.005:0.10  0.1:0.01:0.5]; %establishes r values to test
    
    % calls function for each r value
    for i = 1:length(rVec) 
        % stores the value from each function call into a vector
        probVec(i) = estimate_Coin_In_Square_Probability(rVec(i),N);
        
    end
    
 % plots the radii against probability of being completely inside of the
 % boundary
 plot(rVec, probVec)
 title('Probability vs. Radii')
 xlabel('Radii')
 ylabel('Probability')