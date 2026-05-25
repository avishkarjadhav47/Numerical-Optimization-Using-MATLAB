%Bisection Method                                                                                                   clc
clear all
f=input('Enter the function:');
a=input('Enter the left side of the interval:');
b=input('Enter the right side of the interval:');
max=input('Enter the maximun nuber of iterations:');
tol=input('Enter the tolerance:');
n = 0;

if f(a)*f(b)>0
    fprintf('Root does not lie in this interval');
end

while abs(a-b)>=tol && n<=max
    c=(a+b)/2;
    fprintf('Root %d=%.6f \n',n,c);
    if f(c)==0
        fprintf('Root=%.6f',c);
    end
    if f(a)*f(c)<0
        b=c;
    elseif f(b)*f(c)<0
        a=c;
    end
    n=n+1;
end
n
c