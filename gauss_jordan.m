clc
clear all

% --- Inputs ---
A = input('Enter the coefficient matrix A: ');
B = input('Enter the right-hand side vector B: ');

[n, m] = size(A);
G = [A B];   % Augmented matrix

% --- Gauss-Jordan elimination ---
for i = 1:n
    % Make pivot = 1
    G(i,:) = G(i,:) / G(i,i);
    
    % Eliminate other rows
    for j = 1:n
        if j ~= i
            G(j,:) = G(j,:) - G(j,i)*G(i,:);
        end
    end
end

% --- Solution ---
x = G(:,end);

fprintf('\nSolution vector x = \n');
disp(x);
