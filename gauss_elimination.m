%Simple Gauss Elimination
%Step1-Input
clc
clear all
A=input('Enter the coefficient matrix A:');%Enter coefficient matrix
B=input('Enter the right-hand side vector B:');%Enter R.H.S of system of equation
M=[A B];%Augumented matrix
n=size(M,1);%No. of rows of augumented matrix
x=zeros(n,1); %Initialize all solution as zeros

%Step2-Forward Elimination
for i=1:n-1
    for j=i+1:n
        key=M(j,i)/M(i,i);%Find pivot key element
        M(j,:)=M(j,:)-key*M(i,:);%Apply elementry row operation
    end
end

%Step3-Back Substitution
for i=n:-1:1 %Perform back substitution
    h=sum(M(i,i+1:end-1)*x(i+1:end));%Compute sum of elements
    x(i)=(M(i,end)-h)/M(i,i);%Finding solution
end

%Step4-Output
x