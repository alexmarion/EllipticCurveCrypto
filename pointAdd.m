function [xR, yR] = pointAdd(xP, yP, xQ, yQ, p)
% Must check if -P = Q --> (xP, -yP mod p)
if xP == xQ && yP == mod(-yQ, p)
    error('pointAdd error: -P == P');
end

% Compute the numerator and denominator for mod arithmetic 
numerator = mod(yP-yQ, p);
denominator = mod(modInv(xP-xQ, p), p);

s = mod(numerator * denominator, p);
%s = mod((yP-yQ)/(xP-xQ), p);
xR = mod(s.^2 - xP - xQ, p);
yR = mod(-yP + s * (xP - xR), p);
end