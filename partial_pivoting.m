%Partial Pivoting
%Step1-Input
clc
clear all
A=input('Enter the coefficient matrix A:');%Enter coefficient matrix
B=input('Enter the right-hand side vector B:');%Enter R.H.S of system of equation
M=[A B];%Augumented matrix
n=size(M,1);%No. of rows of augumented matrix
x=zeros(n,1);

%Step2-Partial Pivoting+Forward Elimination
for i=1:n-1
    [max_val,p]=max(abs(M(i:n,i)));%Find Max element & its position
    c=M(i,:);%Interchange row
    M(i,:)=M(p+i-1,:);
    M(p+i-1,:)=c;
    for j=i+1:n
        key=M(j,i)/M(i,i);
        M(j,:)=M(j,:)-key*M(i,:);
    end
end

%Step3-Back Substitution
for i=n:-1:1
    h=sum(M(i,i+1:end-1)*x(i+1:end));
    x(i)=(M(i,end)-h)/M(i,i);
end

%Step4-Output
x