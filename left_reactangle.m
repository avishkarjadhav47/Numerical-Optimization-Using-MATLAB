% Left Rectangle Rule
clc
clear all
f = input('Enter the function: ');
a = input('Enter lower limit: ');
b = input('Enter upper limit: ');

i = f(a) * (b - a);
i

%{
clc
clear all
f = input('Enter the function: ');
a = input('Enter the lower limit: ');
b = input('Enter the upper limit: ');
n = input('Enter number of intervals: ');
h = (b - a) / n;
x = a:h:(b-h);     % left endpoints
y = arrayfun(f, x);

i = h * sum(y);

fprintf('The approximate integral is: %.4f\n', i);
%}

