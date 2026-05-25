%Newton's Backward
clc
clear all
x = input('Enter the values of x (equal spaced): ');
y = input('Enter the values of y: ');
X = input('Enter the value of X: ');
n = length(x);
h = x(2) - x(1);
BD = zeros(n,n);
BD(:,1) = y';
value = BD(n,1);
prod = 1;
u = (X - x(end)) / h;

for j = 2:n
    for i = n:-1:j
        BD(i,j) = BD(i,j-1) - BD(i-1,j-1);
    end
end

disp(BD);

for j = 1:n-1
    prod = prod * (u + (j-1));
    value = value + (BD(n,j+1) * prod) / factorial(j);
end

X
