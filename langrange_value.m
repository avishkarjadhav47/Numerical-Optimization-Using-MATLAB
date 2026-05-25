%Lagrange
clc
clear all
x = input('Enter the values of x: ');
y = input('Enter the values of y: ');
X = input('Enter the value of X: ');
n = length(x);
L = 0;

for i = 1:n
    li = 1;
    for j = 1:n
        if j ~= i
            li = li * (X - x(j)) / (x(i) - x(j));
        end
    end
    L = L + li * y(i);
end

L
