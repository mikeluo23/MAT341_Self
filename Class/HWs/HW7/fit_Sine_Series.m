function fit_Sine_Series()

% Initialize rows of matrix/# of data points and obtain x and y data
N=500;
xData = linspace(-pi,pi,N);
yData =( (0.25*xData.^2).*cos(xData).^4.*sin(xData).^7)';    

% initialize number of sine series to fit to data
% M = 5;
% M = 10;
M = 20;
% M = 40;
A = zeros(N,M);

% create matrix
for i = 1:M
   xMat = i*xData;
   A(:,i) = sin(xMat);
end

A;

% calculate pseudo-inverse
y = yData;
b = inv(A'*A)*A'*y;

% Create model y-vector
sineFit = 0;
for j = 1:M
    sineFit = sineFit + b(j)*sin(j.*xData);
end

% calculate residual
r = sqrt((yData - A*b)'*((yData - A*b)));

% plot data
plot(xData, yData, 'b', 'linewidth', 6); hold on;
plot(xData, sineFit, 'r', 'linewidth', 4); hold on;
xlabel('x');
ylabel('y');
title('Fitting data to Sine Series');
legend('Data','Best Sine Series Fit');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Questions
% 2a) When M = 5, r = 0.0813. When M = 10, r = 0.0096. When M = 20, r =
% 2.14e-6. When M = 40, r = 3.9199e-9. As M increases, the value of the
% residual decreases. 
% 2b) Fourier Series
%
%
%
%
%
%
%
%
%
