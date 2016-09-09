function [n, points] = computeOrder(xG, yG, a, p)
n = 1;
points = [xG,yG];
% On first run must use point doubling
[x, y] = pointDouble(xG, yG, a, p);
points = [points;x,y];

% Use point addition
% Index at second point
pIndex = 2;
%disp(points)

% While generator point not equal to -P
while ~(xG == points(pIndex, 1) && yG == mod(-points(pIndex, 2), p))
    % Add point to generator point and put in list 
    [x, y] = pointAdd(xG, yG, points(pIndex, 1), points(pIndex, 2), p);
    points = [points;x,y];
    % Increment index
    pIndex = pIndex + 1;
end
n = length(points) + 1;
end
