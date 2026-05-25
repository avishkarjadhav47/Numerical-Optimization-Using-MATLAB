function [Z, H_total] = lower_hessenberg_householder(A)
%====================================================
%          HOUSEHOLDER → LOWER HESSENBERG REDUCTION
%====================================================
%
% This function reduces a given square matrix A
% to LOWER Hessenberg form using Householder reflections.
% That means all entries to the RIGHT of the first superdiagonal
% will be zeroed out.
%
% Output:
%   Z  = lower Hessenberg form of A
%   H_total = orthogonal matrix such that  Z = H_total * A * H_total'
%
%====================================================

Aorig = A;
[n, ~] = size(A);
H_total = eye(n);

fprintf('\n====================================================\n');
fprintf('          HOUSEHOLDER → LOWER HESSENBERG REDUCTION\n');
fprintf('====================================================\n\n');

fprintf('Original Matrix A:\n');
disp(A);

fprintf('\nStarting Householder reduction (LOWER Hessenberg)...\n');
fprintf('We will perform %d steps (k = 1 to %d)\n\n', n-2, n-2);

for k = 1:n-2
    fprintf('----------------------------------------------------\n');
    fprintf(' STEP %d:\n', k);
    fprintf('----------------------------------------------------\n');
    fprintf('Zero out entries RIGHT of first superdiagonal in row %d\n\n', k);

    %----------------------------------------------------
    % 1️⃣ Extract subvector to eliminate (row-wise)
    %----------------------------------------------------
    x = A(k, k+2:n)';      % column vector from row k
    fprintf('→ Subvector x = A(%d, %d:%d)^T:\n', k, k+2, n);
    disp(x);

    if norm(x) < eps
        fprintf('‖x‖₂ ≈ 0 → No elimination needed.\n');
        continue;
    end

    nx = norm(x);
    fprintf('‖x‖₂ = %.7f\n\n', nx);

    %----------------------------------------------------
    % 2️⃣ Compute Householder components
    %----------------------------------------------------
    u = x / nx;
    fprintf('→ Normalized vector u = x / ‖x‖₂:\n');
    disp(u);

    v = -sign(x(1)) * [1; zeros(length(x)-1,1)];
    fprintf('→ Reflection vector v = -sign(x₁) * e₁:\n');
    disp(v);

    diff = u - v;
    nd = norm(diff);
    fprintf('→ Difference (u - v):\n');
    disp(diff);
    fprintf('‖u - v‖₂ = %.7f\n', nd);

    w = diff / nd;
    fprintf('→ Householder direction w = (u - v)/‖u - v‖₂:\n');
    disp(w);

    %----------------------------------------------------
    % 3️⃣ Construct small Householder matrix Ĥ_k
    %----------------------------------------------------
    Hhat = eye(length(w)) - 2 * (w * w');
    fprintf('\n→ Small Householder matrix Ĥ_%d = I - 2 w wᵀ:\n', k);
    disp(Hhat);

    %----------------------------------------------------
    % 4️⃣ Embed into full matrix H_k
    %----------------------------------------------------
    H = eye(n);
    H(k+1:n, k+1:n) = Hhat;

    fprintf('→ Full embedded H_%d (size %dx%d):\n', k, n, n);
    disp(H);

    %----------------------------------------------------
    % 5️⃣ Apply similarity transform A := H * A * H'
    %----------------------------------------------------
    A = H * A * H';
    fprintf('→ Apply similarity transform: A := H_%d * A * H_%dᵀ\n', k, k);

    fprintf('  Updated matrix A after step %d:\n', k);
    disp(A);

    %----------------------------------------------------
    % 6️⃣ Update cumulative orthogonal matrix
    %----------------------------------------------------
    H_total = H * H_total;
    fprintf('→ Update cumulative orthogonal matrix H_total = H_%d * H_total:\n', k);
    disp(H_total);

    %----------------------------------------------------
    % 7️⃣ Check zeroing pattern
    %----------------------------------------------------
    fprintf('→ Entries RIGHT of first superdiagonal in row %d (should be ≈ 0):\n', k);
    disp(A(k, k+2:n));

    fprintf('✅ Step %d completed successfully.\n\n', k);
end

%----------------------------------------------------
% Final results summary
%----------------------------------------------------
fprintf('====================================================\n');
fprintf('                FINAL RESULTS SUMMARY\n');
fprintf('====================================================\n');

fprintf('Lower Hessenberg matrix Z:\n');
disp(A);

fprintf('Orthogonal matrix H_total (such that Z = H_total * Aorig * H_totalᵀ):\n');
disp(H_total);

verify = max(max(abs(A - H_total * Aorig * H_total')));
fprintf('Verification: ||Z - H*Aorig*Hᵀ||ₘₐₓ = %.7e\n', verify);

fprintf('\n✅ Householder LOWER Hessenberg reduction completed successfully.\n');
fprintf('====================================================\n\n');

Z = A;
end
