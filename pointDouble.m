function [xR, yR] = pointDouble(xP, yP, a, p)
if yP == 0
    error('pointDouble error: yP cannot equal 0');
end

% Compute the numerator and denominator for mod arithmetic 
numerator = mod(3 * xP.^2 + a, p);
denominator = mod(modInv(2 * yP, p), p);

s = mod(numerator * denominator, p);
xR = mod(s.^2 - 2 * xP, p);
yR = mod(-yP + s * (xP - xR), p);
end