% In this function, I used polar coordinates (radians) as the problem generalizes
% regardless of radius length
% Theoretically, given any two points, take the shortest arclength between
% those points and move the boundaries pi radians (180 degrees) to create
% the boundaries for the third point. The end points of the boundaries
% create a right triangle which is where the hypotenuse contains the
% origin. Thus, the two right triangles serve as the extreme cases. Any
% third point within the range of the two extreme cases also contains the
% origin.

function prob = estimateTriangleCenterCircleProbability(N)

count = 0;

for i = 1:N % number of trials

%establishes random angles, 2*pi + angle is equivalent coordinate wise
angle_1 = 2*pi*rand;
angle_2 = 2*pi*rand;
angle_3 = 2*pi*rand;
angle_3eqv = angle_3 + 2*pi;

% the bound length is the shortest distance between the first two points,
% either absolute difference or 2*pi - abs. difference because it can
% circumvent either direction of the circle
bound_length_1 = abs(angle_1 - angle_2);

if( bound_length_1 < 2*pi-bound_length_1 ) 
    bound_length = bound_length_1;
else
    bound_length = 2*pi-bound_length_1;
end 

bound_1 = angle_1 + pi;
bound_2 = angle_2 + pi;

low_bound = min(bound_1, bound_2);
up_bound = low_bound + bound_length;

% if angle or equivalent angle is within the established boundary, then the
% triangle contains the origin
if( (angle_3 >= low_bound && angle_3 <= up_bound)) 
    count = count + 1;
elseif(angle_3eqv >= low_bound && angle_3eqv <= up_bound)
    count = count + 1;
end

end

prob = count/N; % calculates probability