%Newton Raphson                                                                                                        clc
clear all
f=input('Enter the function:');
df=input('Enter the derivative of function:');
max=input('Enter the maximum number of iterations:');
tol=input('Enter the tolerance:');
x0=input('enter the initial guess:');
n=0;

while n<=max
    if df(x0)==0
    fprintf('Derivative is zero. Can not procced');
    end
    x1=x0-((f(x0))/(df(x0)));
    fprintf('%d=%.6f',n,x1)
    if abs(x1-x0)<=tol || abs(f(x1))<=tol
        break;
    end
    x0=x1;
    n=n+1;
end

n
x1