clc
clear all
x = input('Enter the value of x: ');
y = input('Enter the value of y: ');
X = input('Enter desired value of x: ');
poly = '';   % to store polynomial text

for i = 1:size(x,2)
    x1 = x;
    x1(i) = [];
    l(i) = prod(X - x1) ./ prod(x(i) - x1);

    % Short & simple polynomial text builder
    term = sprintf('%g', y(i));
    for j = 1:size(x1,2)
        term = [term sprintf('*(x-%g)/(%g-%g)', x1(j), x(i), x1(j))];
    end
    if i < size(x,2)
        term = [term ' + '];
    end
    poly = [poly term];
end

Y = sum(l .* y);
fprintf('Value of Y at X=%f is %f\n', X, Y);
fprintf('\nP(x) = %s\n', poly);
