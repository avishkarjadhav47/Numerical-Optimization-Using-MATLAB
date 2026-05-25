clc
clear all

% --- Inputs ---
A = input('Enter the coefficient matrix A: ');
B = input('Enter the right-hand side vector B: ');

[n, m] = size(A);
if n ~= m
    error('Matrix A must be square.');
end
if length(B) ~= n
    error('Size of B must match number of rows of A.');
end

% --- Augmented matrix ---
G = [A B];
col_order = 1:n; % Track column swaps

% --- Forward elimination with complete pivoting ---
for i = 1:n-1
    % Find max element in submatrix G(i:n, i:n)
    [max_val, idx] = max(abs(G(i:n, i:n)), [], 'all', 'linear');
    [row_offset, col_offset] = ind2sub([n-i+1, n-i+1], idx);
    pivot_row = i + row_offset - 1;
    pivot_col = i + col_offset - 1;
    
    % Swap rows
    if pivot_row ~= i
        G([i, pivot_row], :) = G([pivot_row, i], :);
    end
    
    % Swap columns
    if pivot_col ~= i
        G(:, [i, pivot_col]) = G(:, [pivot_col, i]);
        col_order([i, pivot_col]) = col_order([pivot_col, i]); % Track variable order
    end
    
    % Eliminate below pivot
    for j = i+1:n
        factor = G(j,i)/G(i,i);
        G(j,:) = G(j,:) - factor*G(i,:);
    end
end

% --- Back substitution ---
x = zeros(n,1);
for i = n:-1:1
    x(i) = (G(i,end) - G(i,i+1:n)*x(i+1:end)) / G(i,i);
end

% --- Reorder solution according to original columns ---
x_final = zeros(n,1);
x_final(col_order) = x;

% --- Display solution ---
fprintf('\nSolution vector x = \n');
disp(x_final);
