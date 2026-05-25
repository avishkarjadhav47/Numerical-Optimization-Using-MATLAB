function [Z, H] = practice()
% ============================================================
% HOUSEHOLDER → HESSENBERG REDUCTION (DETAILED VERSION)
%
% Reduces user-input matrix to Hessenberg form using
% Householder reflections. Shows every intermediate step:
% x, ||x||₂, u, v, u−v, ||u−v||₂, w, Ĥₖ, Hₖ, Aₖ, etc.
%
% Z = Hessenberg form
% H = Orthogonal matrix such that Hᵀ * A * H = Z
% ============================================================

clc; clearvars; format long g;
fprintf('\n====================================================\n');
fprintf('        HOUSEHOLDER → HESSENBERG REDUCTION\n');
fprintf('====================================================\n\n');

%% === Step 1: Input Matrix ===
n = input('Enter matrix size n (for n×n): ');
A = zeros(n,n);
fprintf('\nEnter elements of matrix A row by row:\n');
for i = 1:n
    for j = 1:n
        A(i,j) = input(sprintf('  A(%d,%d) = ', i, j));
    end
end

fprintf('\nOriginal Matrix A:\n');
disp(round(A,7));
Aorig = A;

%% === Step 2: Choose Hessenberg Type ===
choice = input('\nType ''upper'' for upper-Hessenberg (default) or ''lower'': ','s');
if isempty(choice)
    choice = 'upper';
end

if strcmpi(choice,'lower')
    fprintf('\nConverting to LOWER Hessenberg problem by transposing A.\n');
    A = A';
    apply_transpose_back = true;
else
    apply_transpose_back = false;
end

%% === Step 3: Initialization ===
Z = A;
H_total = eye(n);
fprintf('\nStarting Householder reduction ...\n');
fprintf('We will perform %d steps (k = 1 to %d)\n\n', max(0,n-2), max(0,n-2));

%% === Step 4: Main Iterative Process ===
for k = 1:max(0,n-2)
    fprintf('----------------------------------------------------\n');
    fprintf(' STEP %d: Zero out entries below first subdiagonal in column %d\n', k, k);
    fprintf('----------------------------------------------------\n');

    % Extract subvector below diagonal
    x = Z(k+1:n, k);
    fprintf('\n→ Subvector x = A(%d+1:%d, %d):\n', k, n, k);
    disp(round(x,7));

    % Skip if already zeros
    if all(abs(x) < 1e-12)
        fprintf('All entries already zero. Skipping step.\n\n');
        continue;
    end

    %% === Compute Norm of x ===
    norm_x = norm(x,2);
    fprintf('‖x‖₂ = %.7f\n', norm_x);

    %% === Compute u, v, and w ===
    u = x / norm_x;
    v = -sign(x(1)) * eye(length(x),1);
    if v(1) == 0
        v(1) = -1; % handle x(1)=0
    end

    diff_uv = u - v;
    norm_uv = norm(diff_uv,2);
    w = diff_uv / norm_uv;

    %% === Display intermediate vectors and norms ===
    fprintf('\n→ Normalized vector u = x / ‖x‖₂:\n');
    disp(round(u,7));

    fprintf('→ Reflection vector v = -sign(x₁) * e₁:\n');
    disp(round(v,7));

    fprintf('→ Difference (u - v):\n');
    disp(round(diff_uv,7));

    fprintf('‖u - v‖₂ = %.7f\n', norm_uv);

    fprintf('→ Householder direction w = (u - v) / ‖u - v‖₂:\n');
    disp(round(w,7));

    %% === Construct Small Householder Matrix Ĥₖ ===
    H_hat = eye(length(w)) - 2 * (w * w');
    fprintf('\n→ Small Householder matrix Ĥ_%d = I - 2 w wᵀ:\n', k);
    disp(round(H_hat,7));

    %% === Embed Ĥₖ into full Hₖ ===
    Hk = eye(n);
    Hk(k+1:n, k+1:n) = H_hat;
    fprintf('→ Full embedded H_%d (size %d×%d):\n', k, n, n);
    disp(round(Hk,7));

    %% === Apply Similarity Transformation ===
    fprintf('→ Apply similarity transform: A := H_%dᵀ * A * H_%d\n', k, k);
    Z = Hk' * Z * Hk;
    fprintf('  Updated A after step %d:\n', k);
    disp(round(Z,7));

    %% === Accumulate Orthogonal Transformations ===
    H_total = H_total * Hk;
    fprintf('→ Update cumulative orthogonal matrix H_total = H_total * H_%d:\n', k);
    disp(round(H_total,7));

    %% === Check Zero Entries Below Subdiagonal ===
    if k+2 <= n
        fprintf('→ Entries below first subdiagonal in column %d (should be ≈ 0):\n', k);
        disp(round(Z(k+2:n, k),7));
    end

    fprintf('✅ Step %d completed successfully.\n\n', k);
end

%% === Step 5: Finalization ===
Z = round(Z,7);
H = round(H_total,7);

if apply_transpose_back
    Z = Z';
    H = H';
    fprintf('Converted back to LOWER Hessenberg form (transposed results).\n');
end

fprintf('====================================================\n');
fprintf('                FINAL RESULTS SUMMARY\n');
fprintf('====================================================\n');
fprintf('Hessenberg matrix Z:\n');
disp(Z);
fprintf('Orthogonal matrix H (such that Hᵀ * A * H = Z):\n');
disp(H);

%% === Step 6: Verification ===
Z_check = round(H' * Aorig * H,7);
maxdiff = max(abs(Z(:)-Z_check(:)));
fprintf('Verification: ||Z - Hᵀ * A * H||ₘₐₓ = %.7e\n', maxdiff);
fprintf('\n✅ Householder Hessenberg reduction completed successfully.\n');
fprintf('====================================================\n\n');

end
