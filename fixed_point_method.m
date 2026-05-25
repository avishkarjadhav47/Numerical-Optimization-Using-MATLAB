%Fixed Point 
clear all
f = input('Enter iteration function g(x): ');
df = input('Enter derivative g''(x): ');
max = input('Enter max iterations: ');
tol = input('Enter tolerance: ');
x0 = input('Enter initial guess: ');
n = 0;

if abs(df(x0)) > 1
    disp('Fixed point may not converge'); 
end

while n <=max
    x1 = f(x0);
    fprintf(' %d=%.12f\n', n, x1);
    if abs(x1 - x0) <= tol 
        break;
    end
    n = n + 1;
    x0 = x1;
end
n
x1