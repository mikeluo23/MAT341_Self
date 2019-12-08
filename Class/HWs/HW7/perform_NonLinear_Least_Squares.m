function perform_NonLinear_Least_Squares()
% Initialize data points and return matrix of size 2500x2
% x and y coordinates are individually stored in vectors

N = 2500;
A = give_NonLinear_Least_Squares_Data(N);
xVec = A(:,1);
yVec = A(:,2);

%mat = zeros(N,2);
%mat(:,1) = xVec;
%mat(:,2) = yVec;

% initialize Jacobian, step size, and initial B values
J = zeros(N,3);
delY = zeros(N,1);
B = [1 0.5 0.3]';

% initialize error and tolerance to enter the while loop
err = 1;
tol = 1e-5;
p = 0; % counter

while(err > tol) 

    p = p + 1;
    
    % create jacobian matrix, and Y step direction
    for i = 1:N
        J(i,1) = fB0(xVec(i),B);
        J(i,2) = fB1(xVec(i),B);
        J(i,3) = fB2(xVec(i),B);
        delY(i) = f(xVec(i),B);
    end

% Calculate change in Y and B   
delY = yVec - delY;
delB = inv(J'*J)*J'*delY;

% Calculate new B set
B1 = B + delB;
% calculate error
err = sqrt((B1 - B)' * (B1 - B));
% for i = 1:N
%     yVals(i) = f(xVec(i),B);
% end
% 
% err = sqrt((yVec - yVals')' * (yVec - yVals'))
B = B1;

end



for i = 1:N
    yVals(i) = f(xVec(i),B);
end
% calculate residual, print the set of B values, and number of iterations 
r = sqrt( (yVec - yVals')' * (yVec - yVals') )
B
p
% Plots the data!
%fs = 18; % FontSize
%ms = 20; % MarkerSize

% Plot the data
plot(xVec,yVec, 'b.','MarkerSize', 20); hold on;
plot(xVec,yVals,'r', 'linewidth', 6);hold off;

xlabel('x');
ylabel('y');
title('Nonlinear Least Squares Fit')
legend('Data','Model Fit');
%set(gca,'FontSize',fs);
%set(leg,'FontSize',fs);


% model function
function val = f(x,B)
    val = B(1)*exp(-(x-B(2))^2/(2*B(3)^2));

% partial in terms of B0
function val0 = fB0(x, B)
    val0 = exp(-(x-B(2))^2/(2*B(3)));

% partial in terms of B1
function val1 = fB1(x, B)
    val1 = (B(1)*(x-B(2))/B(3)^2)*exp(-(x-B(2))/(2*B(3)^2));

% partial in terms of B2
function val2 = fB2(x, B)
    val2 = B(1) * exp(-(x-B(2))^2/(2*B(3))) * ((-(x-B(2))^2)/2) * (-2/B(3)^3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Questions
% 3a) The optimal B set is [0.8247; 0.5000; 0.2391] at a tolerance of 1e-5.
%
% 3b) The optimal B set gives a residual of 10.4095 (+/- ~0.3).
%
%
%
%
%
%
%
%