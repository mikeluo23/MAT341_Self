function fit_Polynomial_Series()

% initialize matrix dimensions and data points 
%N = 10;
N = 50;
%N = 250;
xData=linspace(-2*pi,2*pi,N);
yData=cos(xData)'; % apostrophe will make it a column vector

% establish polynomial matrix
A = zeros(N,13);
for i = 1:13
    A(:,i) = xData.^(i-1);
end

% calculated pseudo-inverse
y = yData;
b = inv(A'*A)*A'*y;

polyFit = 0;
for j = 1:13
    polyFit = polyFit + b(j)*xData.^(j-1);
end

% calculate residual
r = sqrt((yData - A*b)'*((yData - A*b)))

% plot data with model fit
plot(xData, yData, 'b', 'linewidth', 6); hold on;
plot(xData, polyFit, 'r', 'linewidth', 4); hold off;
xlabel('x');
ylabel('y');
title('Fitting data to 12th order polynomial');
legend('Data','Best Poly Fit');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Questions
% 1a) When N = 10, the residual(r) equals 1.791. When N = 50, r = 5.15e-4.
% When N = 250, r = 0.0011. It seems that there is a minimum residual
% value. However, the average residual per data point continuously
% decreases as N increases. There are simply more residuals to add together
% when there are more data points but the fit is overall more accurate with
% more data points. 
%
% 1b) We first saw cos(x) written as a polynomial in Calc B (or most
% recently in Dynamical Systems when proving Euler's formula  (e^{i*pi} -
% 1 = 0) ). This is called a taylor series expansion. The coefficients are
% ((-1)^n)*(1/(2n)!) starting from n = 0. Also, they are in terms of the
% even powers of x.
% 
% 1c) The coefficients that I found for N = 250 are b = [0.9999 0.0000
% -0.4998 -0.0000 0.0416 0.0000 -0.0014 -0.0000 0.0000 0.0000 -0.0000
% -0.0000 0.0000]. 
%
% 1d) The coefficients for N = 250 were extremely similar to that of N =
% 50 as they gave qualitatively similar fits. However, even though N = 10
% gave a qualitatively worse fit, the set of B values were not that
% different from N = 50 or N = 250. 
% N = 10: B = [0.9841 -0.0000 -0.4610 0.0006 0.0290 -0.0002 -0.0002 0.0000
% -0.0000 -0.0000 -0.0000 0.0000 0.0000]
% N = 50: B = [0.9999 -0.0000 -0.4998 0.0000 0.0416 -0.0000 -0.0014 0.0000
% 0.0000 -0.0000 -0.0000 0.0000 0.0000]
% The set of B values are much more precise to the theoretical taylor
% series coefficents for N = 50 or 250 when compared to N = 10.
