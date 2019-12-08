function plot_Gaussian_Elimination_Scaling()

% initialize matrix size vector
NVec = 2:1:100;

% store iterations in a vector
for i = 1:length(NVec)
    OpCountVec(i) = go_Go_Gaussian_Elimination(NVec(i));
end

% plots
figure(1)
loglog(NVec, OpCountVec, 'b', 'linewidth', 5);
xlabel('Size of Matrix (NxN)');
ylabel('Operation Count');
title('Log Operation Count v. Log Size of Matrix')

figure(2)
plot(NVec, OpCountVec, 'b', 'linewidth', 5);
xlabel('Size of Matrix (NxN)');
ylabel('Operation Count');
title('Operation Count v. Size of Matrix')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Questions
% 4a) As N increases, the number of iterations increases exponentially. It
% is seen through the regular plot and a linear loglog plot also suggests
% an exponential relationship. This is likely do to the fact that as you
% increase N, you must the iterations for N-1 plus a function of N.
% Therefore the gap between the iterations of consecutive matrix sizes
% continuously increases and it does so exponentially. Additionally, with 3
% nested for loops in the algorithm, this suggests that the operation count
% is a relationship of order 3 (cubic).