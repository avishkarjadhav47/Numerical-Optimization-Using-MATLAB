%Trapezoidal Rule
clc
clear all
f = input('Enter the function: ');
a = input('Enter lower limit: ');
b = input('Enter upper limit: ');

i= ((b - a)/2) * (f(a) + f(b));
i


%{
clc
clear all
f=input('Enter the function:');
a=input('Enter the lower limit:');
b=input('Enter the upper limit:');
n=input('Enter number of intervals:');
h = (b - a) / n; 
x = a:h:b; 
y = arrayfun(f, x); 

i = (h/2) * (y(1) + 2 * sum(y(2:1:end-1)) + y(end)); 

fprintf('The approximate integral is: %.4f\n', i);
%}