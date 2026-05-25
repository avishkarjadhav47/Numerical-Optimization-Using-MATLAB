%newton's Forward
clc
clear all
x = input('Enter the values of x (equal spaced): ');
y = input('Enter the values of y: ');
X = input('Enter the value of X: ');
n = length(x);
h = x(2) - x(1);
FD = zeros(n,n);
FD(:,1) = y';
value = FD(1,1);
prod = 1;
u = (X - x(1)) / h;

for j = 2:n
    for i = 1:n-j+1
        FD(i,j) = FD(i+1,j-1) - FD(i,j-1);
    end
end

disp(FD);

for j = 1:n-1
    prod = prod * (u - (j-1));
    value = value + (FD(1,j+1) * prod) / factorial(j);
end

X
