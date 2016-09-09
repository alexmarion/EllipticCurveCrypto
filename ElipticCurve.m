% Domain Parameters:
% p = Field that curve is defined over
% a,b = Values define the curve
% g = Generator point
% n = prime order of g (smallest num s.t. n*g = elliptic identity)
% h = cofactor (number of points over curve n)

% Steps for public/private key pair
% 1. Each party select random value d s.t. 1 <= d <= n-1
% 2. Public: d*g = P = (xG, yG)
% 3. Send P to eachother 
% 4. Calculate 3rd point R = d*P
% *Note --> R = d * (other d) * G = (xR, yR) so both parties have same
%           coordinates. R is kept private. 
% 5. Use R as the key 

a = 2;
b = 2;
p = 17;

plotElipticCurve(a, b)

% Select one of these points for g (change to random later)
points = getPoints(a, b, p);
%disp(points);
xG = points(5,1);
yG = points(5,2);

% Compute 2g, 3g, ..., (n-1)G until a point at infinity 
% keep track of this number n as well as its cofactor h
[n, ordPoints] = computeOrder(xG, yG, a, p);
%disp(ordPoints)
%disp(n);

% Choose d s.t. 1 <= d <= n-1
% Compute d*g (ex if d = 5, find 5g)
d = 9;
xP = ordPoints(d,1);
yP = ordPoints(d,2);

% Exchange points publically
% For now, just choosing another point manually
otherD = 3;
xQ = ordPoints(otherD,1);
yQ = ordPoints(otherD,2);

% Compute d * (exchanged point)
% if d * (other d) >= n, wraparound with mod n
xPQ = xQ;
yPQ = yQ;
for i = 1:d
    % Have to add (xQ, pQ) d times
    if xPQ == xQ && yPQ == yQ
        % Must double the point to start
        [xPQ, yPQ] = pointDouble(xPQ, yPQ, a, p);
    elseif xG == xPQ && yG == mod(-yPQ, p)
        % If the point is equal to the negative origin point, start from
        % the origin again
        [xPQ, yPQ] = pointDouble(xG, yG, a, p);
    else
        % Otherwise continue to add the point (in order to multiply by d)
        [xPQ, yPQ] = pointAdd(xQ, yQ, xPQ, yPQ, p);
    end
end

% Key has been generated 
disp(['KEY: (' num2str(xPQ) ', ' num2str(yPQ) ')']);
