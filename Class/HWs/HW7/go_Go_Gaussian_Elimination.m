% Commented out code indicates a simplification that was used to reduce the
% operation count
% Question is answer in plot_Gaussian_Elimination_Scaling
function OpCount = go_Go_Gaussian_Elimination(N)
% Initialize matrix and operation count
A = rand(N,N);
opscore = 0;
% Converts matrix to row echelon form
for i = 1:(N-1)
    for j = i:(N-1)
        % divide the leading term of the matrix 
        %to the end of the matrix by the leading term (makes leading term 1 
        for w = i:N
            A(i,w) = A(i,w)/A(i,i); 
            opscore = opscore + 1;
        end
        x = A(j+1,i)/A(i,i);
        opscore = opscore + 1;
        
        for k = i:N
            A(j+1,k) = A(j+1,k) - x*A(i,i);
            opscore = opscore + 2;
        end
    end
end

% divides final diagonal by itself (all other entries in this row are 0 so
% it saves computational power to just divide one number instead of the
% whole row
A(N,N) = A(N,N)/A(N,N);
opscore = opscore + 1;

% Converts matrix to row reduced echelon form

for m = N:-1:2  
    for n = (m-1):-1:1
        y = A(n,m)/A(m,m); 
        opscore = opscore + 1;
        A(n,m) = A(n,m) - A(m,m)*y;
        opscore = opscore + 2;
    end
end

% remove semicolon after A to print out matrix
A;
OpCount = opscore;
