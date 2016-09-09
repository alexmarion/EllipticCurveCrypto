function xInv = modInv(x, n)
if gcd(x, n) ~= 1
    error('modInv error: x has no inverse mod n');
end

[~, a, ~] = gcd(x, n);
xInv = mod(a, n);
end

