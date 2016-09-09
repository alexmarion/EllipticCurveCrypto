function [points] = getPoints(a, b, p)
x = 0:p-1;
lhs = mod(x.^2,p);
rhs = mod(x.^3 + a*x + b,p);
points = [];

for i = 1:length(rhs)
    I = find(lhs == rhs(i));
    for j=1:length(I)
        points = [points;x(i),x(I(j))];
    end
end

subplot(1, 2, 2);
plot(points(:,1),points(:,2),'ro');
set(gca,'XTick',0:1:p-1);
set(gca,'YTick',0:1:p-1);
grid on;
title(['Points over F' num2str(p)]);
end