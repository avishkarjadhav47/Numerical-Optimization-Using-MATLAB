%Newton's Divided Difference
clc
clear all
x = input('Enter the values of x: ');
y = input('Enter the values of y: ');
X = input('Enter the value of X: ');
n = length(x);
DD = zeros(n,n);
DD(:,1) = y';
value = DD(1,1);
prod = 1;

for j = 2:n
    for i = 1:n-j+1
        DD(i,j) = (DD(i+1,j-1) - DD(i,j-1)) / (x(i+j-1) - x(i));
    end
end

disp(DD);

for j = 1:n-1
    prod = prod * (X - x(j));
    value = value + DD(1,j+1) * prod;
end

value
