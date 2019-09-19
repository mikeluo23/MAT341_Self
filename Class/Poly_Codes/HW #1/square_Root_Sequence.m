function val = square_Root_Sequence(m,n)
% The way I created this function is essentially from the right side of the
% equation to the left. 

t_n_0 = sqrt(m); % initializes first value of t_n
t_n = t_n_0; % sets the nested square roo

for i = 1:n-1
     t_n = sqrt(m + ((-1)^(n+i))*t_n); % nests the previously calculated value for t_n
end
t_n

% square_Root_Sequence(13,100)
% t_n = 3

% square_Root_Sequence(31,100)
% t_n = 5

%square_Root_Sequence(43,100)
% t_n = 6