% This plot uses equations of the form y^2 = x^3 + ax + b
% Note: check to see that 4a^3 + 27b^2 != 0
function plotElipticCurve(a, b)
curve = strcat('y^2 = x^3 + (',num2str(a),'*x) +',num2str(b));
%modCurve = strcat('mod(y^2, 17) = mod(x^3 + (',num2str(a),'*x) +',num2str(b),',17)');
subplot(1, 2, 1);
ezplot(curve); 
end