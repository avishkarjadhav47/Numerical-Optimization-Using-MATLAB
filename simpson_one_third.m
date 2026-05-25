% Simpson's 1/3 Rule
clc
clear all
f = input('Enter the function: ');
a = input('Enter lower limit: ');
b = input('Enter upper limit: ');
h = (b - a) / 2; 
m = a + h;

i= (b - a)/6* ( f(a) + 4*f(m) + f(b) );
i


%{
clc
clear all
f = input('Enter the function: ');
a = input('Enter the lower limit: ');
b = input('Enter the upper limit: ');
n = input('Enter number of intervals (even number): ');
h = (b - a) / n;
x = a:h:b;
y = arrayfun(f, x);

if mod(n,2) ~= 0
    error('n must be even for Simpson''s 1/3 Rule');
end

i= (h/3) * ( y(1) + 4*sum(y(2:2:end-1)) + 2*sum(y(3:2:end-2)) + y(end) );

fprintf('The approximate integral is: %.4f\n', i);
%}
