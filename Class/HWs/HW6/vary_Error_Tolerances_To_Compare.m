function vary_Error_Tolerances_To_Compare()

% Initialize step size (for fixed step) and tolerance vector 
%gamma = 1.05;
gamma = 0.5;
errTolVec = [1e-1 1e-2 1e-3 1e-4 1e-5 1e-6 1e-7 1e-8 1e-9 1e-10 1e-11];

% Stores number of iterations at each tolerance for both fixed-step and
% barzilai-borwein algorithms
for i = 1:length(errTolVec)
    gdVec1(i) = Gradient_Descent_1(errTolVec(i), gamma);
    gdVec2(i) = Gradient_Descent_2(errTolVec(i));
end

% plots log(err) vs. iterations for both algorithms
% includes axes labels, title, and figure legend
figure(1)
    semilogx(errTolVec, gdVec1, 'b', 'LineWidth', 5); hold on;
    semilogx(errTolVec, gdVec2, 'r', 'LineWidth', 5); hold off;
    legend('Fixed Step', 'Barzilai-Borwein')
    xlabel('log Tolerance')
    ylabel('Iterations')
    title('Iterations v. log Tolerance')
    
% plots log(err) vs. log(iterations) for both algorithms
% includes axes labels, title, and figure legend
figure(2)
    loglog(errTolVec, gdVec1, 'b', 'LineWidth', 5); hold on;
    loglog(errTolVec, gdVec2, 'r', 'LineWidth', 5); hold off;
    legend('Fixed Step', 'Barzilai-Borwein')
    xlabel('log Tolerance')
    ylabel('log Iterations')
    title('log Iterations v. log Tolerance')
    
    
    
% 4a) For high accuracy (low error tolerances) the Barzilai-Borwein
% algorithm converges faster, but the fixed step-size converges faster for
% very low accuracy thresholds. 

% 4b) When the gamma value is changed to 0.5, the Barzilai-Borwein
% step-size converges faster for all accuracy thresholds.

% 4c) Primarily, the Barzilai-Borwein step-size is usually more accurate.
% It is dynamic to find the optimal step-size to minimize the number of
% iterations.

% 4d) I would chose the Barzilai-Borwein algorithm because it is a
% technique that finds the optimal step-size. Using a fixed step size
% requires also finding optimal fixed step size. Moreover, there is an
% optimal step-size for each iteration, which the Barzilai-Borwein is able
% to accommodate for because it is a dynamic. Fixed step sizes fail to
% adjust for this.