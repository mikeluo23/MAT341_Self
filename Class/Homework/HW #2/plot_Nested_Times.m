function plot_Nested_Times()
N = [1:1:10 20:10:100 125 150 175 200 225 250]; % initializes values of N that will call 'calculate_Nested_For_Loop_Time.m' function
times = []; % initializes a time 1xN matrix (array)
for i = 1:length(N)
    times = [times calculate_Nested_For_Loop_Time(N(i))]; % stores time for each N value in array
end 

% Plots and labels
loglog(N,times,'m','LineWidth',4)
xlabel('N')
ylabel('time')
title('Loglog time v. N')
