function val = calculate_Pi_Sums()

val_a = 0; % initializes val_a to 0
val_b = 0; % initializes val_b to 0
N = 1; % number of iterations for val_a
M = 1; % number of iterations of val_b
tol = 10^-6; % error tolerance value
under_tol_a = false; % approximation of val_a is not accurate enough to pi yet (obviously at the start)
under_tol_b = false; % approximation of val_b is not accurate enough to pi yet (obviously at the start)
    
    while(~under_tol_a)
        
        val_a = 0;
        for i = 0:N % adds 
            val_a = val_a + ((6/sqrt(3))) * (( (-1)^i ) / ( 3^i * (2*i+1) ));
        end
        error = abs( pi - val_a ); % calculates error between approximation and actual value of pi
        % val_a - used to test val_a at each 
        if(error < tol)
            under_tol_a = true; % approximation is accurate enough based on set tolerance
        else
            N = N + 1; % tests next value of N 
        end
        
    end  
   M=0 
     while(~under_tol_b)
        
        %val_b = 0;
        %for i = 0:M % adds 
            %val_b = val_b + (16 * ( (-1)^i / ( 5^(2*i+1) * (2*i+1) ) )) - (4 * ((-1)^i / (239^(2*i+1) *(2*i + 1))));
        val_b = val_b + (16 * ( (-1)^M / ( 5^(2*M+1) * (2*M+1) ) )) - (4 * ((-1)^M / (239^(2*M+1) *(2*M + 1))));
        %end
        error = abs( pi - val_b ); % calculates error between approximation and actual value of pi
        % val_b - used to test val_b at each 
        if(error < tol)
            under_tol_b = true; % approximation is accurate enough based on set tolerance
        else
            M = M + 1; % tests next value of M 
        end
        
     end  
val_a
val_b
N
M