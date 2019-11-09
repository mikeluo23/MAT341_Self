function vary_Error_Tolerances_To_Compare()
    
    % initialize error tolerances to test
    errTolVec = [1e-1 1e-2 1e-3 1e-4 1e-5 1e-6 1e-7 1e-8 1e-9 1e-10 1e-11 1e-12];
    
    % calls minimization algorithms for the desired error tolerances
    for k = 1:length(errTolVec)
        goldenSearchVec(k) = golden_Search(errTolVec(k));
        successive_Parabolic_InterpolationVec(k) = successive_Parabolic_Interpolation(errTolVec(k));
        NewtonsMethodVec(k) = Newtons_1D_Opt(k);
    end
    
    % plots semilogx for all 3 algorithms (iterations v. error tolerance)
    figure(1)    
    semilogx(errTolVec, goldenSearchVec, 'b', 'LineWidth', 5); hold on;
    semilogx(errTolVec, successive_Parabolic_InterpolationVec, 'r','LineWidth', 5); hold on;
    semilogx(errTolVec, NewtonsMethodVec, 'k', 'LineWidth', 5); hold off;
    legend('Golden Search','Successive Parabolic Interpolation','Newton Method');
    title('N vs. Log Error Tolerances');
    xlabel('Log Error Tolerances');
    ylabel('N');
    
    
    % plots loglog for all 3 algorithms (iterations v. error tolerance)
    figure(2)
    loglog(errTolVec, goldenSearchVec, 'b','LineWidth', 5); hold on;
    loglog(errTolVec, successive_Parabolic_InterpolationVec, 'r','LineWidth', 5); hold on;
    loglog(errTolVec, NewtonsMethodVec, 'k', 'LineWidth', 5); hold off;
    legend('Golden Search','Successive Parabolic Interpolation','Newton Method');
    title('Log N vs. Log Error Tolerances');
    xlabel('Log Error Tolerances');
    ylabel('Log N');
    
    
    
% a) For less accurate tolerances, the successive parabolic interpolation
% converges to the minimum faster.

% b) When the accuracy threshold is increased, the golden search algorithm
% converges quicker. The golden ratio does not appear to drastically change
% its search speed. However, the successive parabolic interpolation (SPI)
% algorithm drastically slows down once it gets to a certain accuracy
% threshold. This is likely due to the fact that the error threshold is
% compared across 3 points instead of two. Additionally, the golden ratio
% shrinks its boundaries by a fixed ratio whereas SPI can clearly get
% "close" to the minimum very quickly but once it gets close, it struggles
% to become more precise. Once the vertexes get close to the minimum in
% SPI, subsequent vertexes change by such a small amount that it becomes
% difficult to obtain extreme precision. 

% Note: Both row reduced echelon form(RREF) and inverse matrix(IM) algorithms were
% implemented. For large error tolerances, RREF is faster, but for very
% small error tolerances, IM is faster.

% Start of HW5 answers

% 3a) For less accurate tolerances, Newton's method is the fastest to
% converge. Although all the algorithms are relatively quick.

% 3b) When the accuracy threshold is increased, Newton's method remains the
% fastest.

% 3c) The convergence rates on these algorithm can change based on initial
% conditions. From studying each of these algorithms, typically making the
% initial condition closer to the optimal will speed up converge times.
% Additionally, it is apparent that the implementation of derivatives into
% all of these convergence algorithms will also speed up converge times
% (Newton's method was by far the fastest and utilized derivatives).