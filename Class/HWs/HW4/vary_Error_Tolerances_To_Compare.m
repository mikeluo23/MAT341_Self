function vary_Error_Tolerances_To_Compare()
    
    % initialize error tolerances to test
    errTolVec = [1e-1 1e-2 1e-3 1e-4 1e-5 1e-6 1e-7 1e-8 1e-9 1e-10 1e-11 1e-12];
    
    % calls minimization algorithms for the desired error tolerances
    for k = 1:length(errTolVec)
        goldenSearchVec(k) = golden_search(errTolVec(k));
        successive_Parabolic_InterpolationVec(k) = successive_Parabolic_Interpolation(errTolVec(k));
    end
    
    % plots semilogx for both algorithms (iterations v. error tolerance)
    figure(1)    
    semilogx(errTolVec, goldenSearchVec, 'b', 'LineWidth', 5); hold on;
    semilogx(errTolVec, successive_Parabolic_InterpolationVec, 'r','LineWidth', 5); hold off;
    legend('Golden Search','Successive Parabolic Interpolation');
    title('N vs. Log Error Tolerances');
    xlabel('Log Error Tolerances');
    ylabel('N');
    
    
    % plots loglog for both algorithms (iterations v. error tolerance)
    figure(2)
    loglog(errTolVec, goldenSearchVec, 'b','LineWidth', 5); hold on;
    loglog(errTolVec, successive_Parabolic_InterpolationVec, 'r','LineWidth', 5); hold off;
    legend('Golden Search','Successive Parabolic Interpolation');
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
% difficult to obtain extreme precision. This is because the 3 points in SPI become
% approximately collinear which makes finding more accurate consecutive parabolas more
% difficult.

% Note: For large error tolerances, row reduced echelon form (RREF) was more efficient. 
% For small error tolerances, inverted matrices (IM) were utilized. For this algorithm, 
% IM is more optimal (commented out in the SPI code).
