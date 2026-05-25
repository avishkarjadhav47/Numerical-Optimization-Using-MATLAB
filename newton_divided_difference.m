clc
clear all
x = input('Enter the value of x: ');
y = input('Enter the value of y: ');
X = input('Enter desired value of x: ');
n=size(x,2);
DD=zeros(n,n);
DD(:,1)=y';
for j=2:n
    for i=1:(n-j+1)
        num=DD(i+1,j-1)-DD(i,j-1);
        den=(x(i+j-1)-x(i));
        DD(i,j)=num./den;
    end
end  
for i=1:size(x,2)-1
    p(i)=prod(X-x(:,1:i))*DD(1,i+1);
end
Y=y(1)+sum(p);
array2table(DD)
fprintf('Value of Y at X=%f is %f \n',X,Y)
