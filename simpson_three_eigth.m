% Simpson's 3/8 Rule
clc
clear all
f = input('Enter the function: ');
a = input('Enter lower limit: ');
b = input('Enter upper limit: ');
h = (b - a) / 3;

i= (3*h/8) * ( f(a) + 3*f(a+h) + 3*f(a+2*h) + f(b) );
i


%{
clc
clear all
f = input('Enter the function : ');
a = input('Enter the lower limit: ');
b = input('Enter the upper limit: ');
n = input('Enter number of intervals (multiple of 3): ');
h = (b - a) / n;
x = a:h:b;
y = arrayfun(f, x);

if mod(n,3) ~= 0
    error('n must be a multiple of 3 for Simpson''s 3/8 Rule');
end

i= (3*h/8) * ( y(1) + y(end) + 3*sum(y(2:end-1)) - sum(y(4:3:end-1)) );

fprintf('The approximate integral is: %.6f\n', i);
%}
