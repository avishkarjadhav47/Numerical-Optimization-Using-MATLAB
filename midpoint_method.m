% Midpoint Rule
clc
clear all
f = input('Enter the function: ');
a = input('Enter lower limit: ');
b = input('Enter upper limit: ');
m = (a + b)/2;

i= f(m) * (b - a);
i


%{
clc
clear all
f = input('Enter the function: ');
a = input('Enter the lower limit: ');
b = input('Enter the upper limit: ');
n = input('Enter number of intervals: ');
h = (b - a) / n;
x = (a + h/2):h:(b - h/2);   % midpoints
y = arrayfun(f, x);

i = h * sum(y);

fprintf('The approximate integral is: %.4f\n',i);
%}
