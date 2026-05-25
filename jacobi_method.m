%Jacobi Method
%Step1-Input
clc
clear all
A=input('Enter the coefficient matrix A:'); %Enter coefficient matrix
B=input('Enter the right-hand side vector B:'); %Enter R.H.S
tol=input('Enter the maximum error:'); %Set maximum error
max_itr=input('Enter the maximum number  of iterations:');%Set max iteration
n=size(A,1); %Number of rows
x=zeros(n,1); %Initial Guess
err=Inf; %Initial error as high
itr=0; %set iteration counter zero

%Step2-Jacobi Method
for i = 1:n
    R = A(i,:);
    S = sum(abs(R)) - abs(R(i)); % sum of absolute values of non-diagonal elements
    if abs(R(i)) < S   % diagonal element must be >= sum of others
        disp('Given matrix is not diagonally dominant');
        return; % Exit if the matrix is not diagonally dominant
    end
end
disp('Given matrix is diagonally dominant');

while max(err)>tol && itr<=max_itr
    xold=x;%Preserve old value
    for i=1:n
        sum=0; %Initialize sum=0
        for j=1:n
            if j ~= i %Leave the ith variable
                sum = sum + A(i,j) * xold(j); %Compute Total
            end
        end
        x(i) = (B(i) - sum) / A(i,i);%Jacobi method updation
    end
    err = norm(x - xold);%compute error between new & old solution
    itr = itr + 1;%Update iteration counter
    y(itr,:)=x;%Used for printing purpose only
end

%Step3-Output
itr
x