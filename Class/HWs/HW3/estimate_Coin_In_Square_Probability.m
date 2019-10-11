% for N = 1e5, the probabilities fluctuate between about .64 +/- 0.005
% with increased iterations, the probabilities seem to converge to values
% much closer to .64. While N = 1e5 is a reasonable amount of iterations to
% get a good estimate of the probability, it is better to use at least 10e6
% for greater precision

% approach: find random x and y coordinates. if x +/- r or y +/- r are
% >= the upper bound or <= the lower bound, they are not in the square. If
% it is within the bounds, the count goes up


function prob = estimate_Coin_In_Square_Probability(r,N)
    
count = 0; % resets the count
    
    for i = 1:N % number of trials
        
        % random x and y coordinate
        r_x = rand;
        r_y = rand;
        
        % if no part of the coin is touching the boundary then increase the
        % count
        if( ~(r_x + r >= 1 || r_y + r >= 1 || r_x - r <= 0 || r_y - r <= 0) )
            
            count = count + 1;
            
        end
        
    end
    
prob = count/N; % establish probability