%Secant Method                                                                                                          clc
clear all
f = input('Enter the function f(x): ');
a = input('Enter the 1st initial guess: ');
b = input('Enter the 2nd initial guess: ');
max = input('Enter the maximum number of iterations: ');
tol = input('Enter the tolerance: ');
n = 0;

if f(a) * f(b) > 0
    fprintf('Root does not lie between these guesses.\n');
end

while n <=max
    c = (a*f(b) - b*f(a)) / (f(b) - f(a));
    fprintf('Root %d=%.6f \n',n,c);

     if abs(f(c)) < tol || abs(c - b) < tol
         break;
     end
        
        a = b;
        b = c;
        n = n + 1;
    end
n
c